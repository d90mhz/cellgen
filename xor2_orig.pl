#!/usr/local/bin/perl -w


sub xor2	# parameters: lef filehandle, cell name, lambda, height, ratio, psize-aoi, nsize-aoi, psize-nor, nsize-nor
{
	my $lefhandle = shift @_;
	my $cell_name = shift @_;
	my $lambda = shift @_;
	my $height = shift @_;
	my $ratio = shift @_;
	my $psize = shift @_;
	my $nsize = shift @_;
	my $psizen = shift @_;
	my $nsizen = shift @_;

	my $pins = 4;
	my $pinsn = 3;
	my $min_height = 84;
	my $max_psize_min = 22;
	my $max_nsize_min = 22;

	my @coords = (0, 0, 0, 0);
	my @lcoords = (0, 0, 0, 0);
	my @ccoords = (0, 0, 0, 0);
	my ($delta_ph, $delta_nh, $pfolds, $nfolds, $max_folds, $psize_each, $nsize_each, $delta_width, $width)
	  = calc ($lambda, $height, $ratio, $pins, $min_height, $psize, $nsize, $max_psize_min, $max_nsize_min);
	if ($pfolds >= $nfolds)		# reset max number of folds
	{
		$max_folds = $pfolds;
	}
	else
	{
		$max_folds = $nfolds;
	}
	$delta_width = (int($max_folds * 1.5)) * 16;
	$width = 48 + $delta_width;			# cell width

	my ($delta_phn, $delta_nhn, $pfoldsn, $nfoldsn, $max_foldsn, $psize_eachn, $nsize_eachn, $delta_widthn, $widthn)
	  = calc ($lambda, $height, $ratio, $pinsn, $min_height, $psizen, $nsizen, $max_psize_min, $max_nsize_min);

#### IMPORTANT NOTE: MUST USE SINGE DELTA_NH AND DELTA_PH ... CELL HEIGHT IS CONSTANT ACROSS AOI AND NOR !!!!
####  THIS EFFECTIVELY MEANS DELTA_PHN AND DELTA_NHN ARE NOT USED BEYOND THIS POINT
	if ($pfoldsn >= $nfoldsn)		# reset max number of folds
	{
		$max_foldsn = $pfoldsn;
	}
	else
	{
		$max_foldsn = $nfoldsn;
	}
	$delta_widthn = $max_foldsn * 16;
	$widthn = 32 + $delta_widthn;			# cell width

	print $lefhandle "MACRO $cell_name\n  CLASS CORE ;\n";
	@lcoords = lefcoords ($lambda, -32-$delta_widthn, -39-$delta_nh, 48+$delta_width, 39+$delta_ph);	
	printf $lefhandle "  FOREIGN $cell_name %.3f %.3f ;\n", $lcoords[0], $lcoords[1];
	printf $lefhandle "  ORIGIN %.3f %.3f ;\n", - $lcoords[0], - $lcoords[1];
	printf $lefhandle "  SIZE %.3f BY %.3f ;\n", $lcoords[2] - $lcoords[0], $lcoords[3] - $lcoords[1];
	print $lefhandle "  SYMMETRY X Y ;\n  SITE CoreSite ;\n";
	print $lefhandle "  PIN vdd!\n    DIRECTION INOUT ;\n    USE POWER ;\n    SHAPE ABUTMENT ;\n";
	print $lefhandle "    PORT\n    LAYER metal1 ;\n";
	@lcoords = lefcoords ($lambda, -32-$delta_widthn, 37+$delta_ph, 48+$delta_width, 41+$delta_ph);	
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END vdd!\n  PIN gnd!\n    DIRECTION INOUT ;\n    USE GROUND ;\n    SHAPE ABUTMENT ;\n ";
	print $lefhandle "   PORT\n    LAYER metal1 ;\n";
	@lcoords = lefcoords ($lambda, -32-$delta_widthn, -41-$delta_nh, 48+$delta_width, -37-$delta_nh);	
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END gnd!\n  PIN out\n    DIRECTION OUTPUT ;\n    PORT\n    LAYER metal2 ;\n";
	@lcoords = lefcoords ($lambda, 38+$delta_width, -2, 42+$delta_width, 2);	
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END out\n  PIN in0\n    DIRECTION INPUT ;\n    PORT\n    LAYER metal2 ;\n";
	@lcoords = lefcoords ($lambda, -10, -2, -6, 2);									# pin in0
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END in0\n  PIN in1\n    DIRECTION INPUT ;\n    PORT\n    LAYER metal2 ;\n";
	@lcoords = lefcoords ($lambda, 22, -2, 26, 2);									# pin in1
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END in1\n";

## METAL2 SHIELD STRIPES AS PINS
	# AOI
	$i = 0;
	$j = 0;
	until ($i >= $width + 16)
	{
		print $lefhandle "  PIN shield_$j\n    DIRECTION INOUT ;\n    PORT\n    LAYER metal2 ;\n";
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -2+($i), -41-$delta_nh, 2+($i), 41+$delta_ph);			# shield stripes
		print $lefhandle "    END\n  END shield_$j\n";
		$j++;
		$i+=16;
	}
	# NOR
	$i = 16;
	until ($i >= $widthn + 16)
	{
		print $lefhandle "  PIN shield_$j\n    DIRECTION INOUT ;\n    PORT\n    LAYER metal2 ;\n";
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -2-($i), -41-$delta_nh, 2-($i), 41+$delta_ph);			# shield stripes
		print $lefhandle "    END\n  END shield_$j\n";
		$j++;
		$i+=16;
	}

	print $lefhandle "  OBS\n";
## NWELL
	# COM
	print $lefhandle "    LAYER nwell ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -36-$delta_widthn, 0, 52+$delta_width, 45+$delta_ph);
## NSELECT
	print $lefhandle "    LAYER nselect ;\n";
	# COM
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -32-$delta_widthn, 35+$delta_ph, 48+$delta_width, 43+$delta_ph);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -32-$delta_widthn, -35-$delta_nh, 48+$delta_width, 0);
## PSELECT
	print $lefhandle "    LAYER pselect ;\n";
	# COM
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -32-$delta_widthn, -43-$delta_nh, 48+$delta_width, -35-$delta_nh);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -32-$delta_widthn, 0, 48+$delta_width, 35+$delta_ph);
## NACTIVE
	print $lefhandle "    LAYER nactive ;\n";
	# COM
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -30-$delta_widthn, 37+$delta_ph, 46+$delta_width, 41+$delta_ph);
	# AOI
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 2, -28-$delta_nh, 30+(8*($nfolds*($pins-1))), -28+$nsize_each-$delta_nh);
	# NOR	
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -22-(8*($nfoldsn*($pinsn-1))), -28-$delta_nh, -2, -28+$nsize_eachn-$delta_nh);
## PACTIVE
	print $lefhandle "    LAYER pactive ;\n";
	# COM
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -30-$delta_widthn, -41-$delta_nh, 46+$delta_width, -37-$delta_nh);
	# AOI
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 2, 28-$psize_each+$delta_ph, 30+(8*($pfolds*($pins-1))), 28+$delta_ph);
	# NOR
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -22-(8*($pfoldsn*($pinsn-1))), 28-$psize_eachn+$delta_ph, -2, 28+$delta_ph);
## POLY
	print $lefhandle "    LAYER poly ;\n";
	# AOI
	$i = 0;
	if ($max_folds == 0)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 6, -2, 10, 2);
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 14, -2, 18, 2);
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 22, -2, 26, 2);
	}
	until ($i == ($max_folds * ($pins - 1)) + 3)
	{
		if (!(($i >= $max_folds * ($pins - 1)) && ($nfolds == 0) && ($pfolds == 0)))
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 6+(8*$i), -2, 10+(8*$i), 2);
		}
		$i++;
	}
	$i = 0;
	until ($i == ($pfolds * ($pins - 1)) + 3)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 7+(8*$i), 2, 9+(8*$i), 30+$delta_ph);	
		$i++;
	}
	$i = 0;
	until ($i == ($nfolds * ($pins - 1)) + 3)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 7+(8*$i), -30-$delta_nh, 9+(8*$i), -2);	
		$i++;
	}
	# NOR
	$i = 0;
	if ($max_foldsn == 0)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -10, -2, -6, 2);
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -18, -2, -14, 2);
	}
	until ($i == ($max_foldsn * ($pinsn - 1)) + 2)
	{
		if (!(($i >= $max_foldsn * ($pinsn - 1)) && ($nfoldsn == 0) && ($pfoldsn == 0)))
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -10-(8*$i), -2, -6-(8*$i), 2);
		}
		$i++;
	}
	$i = 0;
	until ($i == ($pfoldsn * ($pinsn - 1)) + 2)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -9-(8*$i), 2, -7-(8*$i), 30+$delta_ph);	
		$i++;
	}
	$i = 0;
	until ($i == ($nfoldsn * ($pinsn - 1)) + 2)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -9-(8*$i), -30-$delta_nh, -7-(8*$i), -2);	
		$i++;
	}
## METAL1
	print $lefhandle "    LAYER metal1 ;\n";
	# COM
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -2, 2, 2, 17);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -2, -2, 6, 2);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -10, -5, -6, -2);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -10, -8, 18, -5);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 14, -5, 18, -2);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -18, -11, -14, -2);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -18, -14, 26, -11);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 22, -11, 26, -2);
	# AOI
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 38+$delta_width, -17, 42+$delta_width, 17);		# out bridge
	$i = 0;
	until ($i == ($max_folds * ($pins - 1)) + 3)
	{
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 6+(8*$i), -2, 10+(8*$i), 2);		# poly contact pads
		}
		$i++;
	}
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 18, 17, 42+$delta_width, 21);				# upper out rail
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 10, -21, 42+$delta_width, -17);			# lower out rail
	$i = 1;
	until ($i == $max_folds + 1)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 26+(24*($i-1)), -2, 30+(24*($i-1)), 2);
		if ($i % 2 == 0)
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 30+(24*($i-2)), -14, 74+(24*($i-2)), -11);	
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 30+(24*($i-2)), -11, 34+(24*($i-2)), -2);	
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 70+(24*($i-2)), -11, 74+(24*($i-2)), -2);	
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 38+(24*($i-2)), -8, 66+(24*($i-2)), -5);	
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 38+(24*($i-2)), -5, 42+(24*($i-2)), -2);	
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 62+(24*($i-2)), -5, 66+(24*($i-2)), -2);	
		}
		else
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 6+(24*($i-1)), 11, 50+(24*($i-1)), 14);	
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 6+(24*($i-1)), 2, 10+(24*($i-1)), 11);	
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 46+(24*($i-1)), 2, 50+(24*($i-1)), 11);	
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 14+(24*($i-1)), 5, 42+(24*($i-1)), 8);	
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 14+(24*($i-1)), 2, 18+(24*($i-1)), 5);	
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 38+(24*($i-1)), 2, 42+(24*($i-1)), 5);	

		}
		$i++;
	}
	$i = 0;
	until ($i == $pfolds + 1)
	{
		if ($i % 2 == 0)
		{
			if (28+$delta_ph-$psize_each > 24)	# if active stops short of out rail
			{
				if ($i == 0)
				{
					printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda,
					  2, 28+$delta_ph-$psize_each, 6, 37+$delta_ph);				# vdd connects
				}
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda,
				  10+(24*($i)), 28+$delta_ph-$psize_each, 14+(24*($i)), 31+$delta_ph);			# internal signal connects
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda,
				  26+(24*($i)), 28+$delta_ph-$psize_each, 30+(24*($i)), 31+$delta_ph);			# internal signal connects
			}
			else
			{
				if ($i == 0)
				{
					printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 2, 24, 6, 37+$delta_ph);	# vdd connects
				}
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 10+(24*($i)), 24, 14+(24*($i)), 31+$delta_ph);	# internal signal connects
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 26+(24*($i)), 24, 30+(24*($i)), 31+$delta_ph);	# internal signal connects
			}
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 18+(24*($i)), 21, 22+(24*($i)), 28+$delta_ph);	# out connects
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 10+(24*($i)), 31+$delta_ph, 30+(24*($i)), 34+$delta_ph);	# internal signal rails
		}
		else
		{
			if (28+$delta_ph-$psize_each > 24)	# if active stops short of out rail
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda,
				  50+(24*($i-1)), 28+$delta_ph-$psize_each, 54+(24*($i-1)), 37+$delta_ph);		# vdd connects
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda,
				  42+(24*($i-1)), 28+$delta_ph-$psize_each, 46+(24*($i-1)), 31+$delta_ph);			# internal signal connects
			}
			else
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 50+(24*($i-1)), 24, 54+(24*($i-1)), 37+$delta_ph);	# vdd connects
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 42+(24*($i-1)), 24, 46+(24*($i-1)), 31+$delta_ph);			# internal signal connects
			}
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 34+(24*($i-1)), 21, 38+(24*($i-1)), 28+$delta_ph);	# out connects
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 30+(24*($i-1)), 31+$delta_ph, 46+(24*($i-1)), 34+$delta_ph);	# internal signal rails
		}
		$i++;
	}
	$i = 0;
	until ($i == $nfolds + 1)
	{
		if ($i % 2 == 0)
		{
			if (-28-$delta_nh+$nsize_each < -24)	# if active stops short of out rail
			{
				if ($i == 0)
				{
					printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda,
					  2, -37-$delta_nh, 6, -28-$delta_nh+$nsize_each);
				}
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda,
				  26+(24*$i), -37-$delta_nh, 30+(24*$i), -28-$delta_nh+$nsize_each);	
			}
			else
			{
				if ($i == 0)
				{
					printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 2, -37-$delta_nh, 6, -24);
				}
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 26+(24*$i), -37-$delta_nh, 30+(24*$i), -24);
			}
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 10+(24*$i), -28-$delta_nh, 14+(24*$i), -21);
		}
		else
		{
			if (-28-$delta_nh+$nsize_each < -24)	# if active stops short of out rail
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda,
				  50+(24*($i-1)), -37-$delta_nh, 54+(24*($i-1)), -28-$delta_nh+$nsize_each);
			}
			else
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 50+(24*($i-1)), -37-$delta_nh, 54+(24*($i-1)), -24);
			}
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 42+(24*($i-1)), -28-$delta_nh, 46+(24*($i-1)), -21);
		}
		$i++;
	}
	# NOR
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -26-$delta_widthn, -17, -22-$delta_widthn, 17);	# out bridge
	$i = 0;
	until ($i == ($max_foldsn * ($pinsn - 1)) + 2)
	{
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -10-(8*$i), -2, -6-(8*$i), 2);	# poly contact pads
		}
		$i++;
	}
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -26-$delta_widthn, 17, 2, 21);			# upper out rail
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -26-$delta_widthn, -21, -10, -17);			# lower out rail
	$i = 1;
	until ($i == $max_foldsn + 1)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -22-(16*($i-1)), -2, -18-(16*($i-1)), 2);				# central pin rail
		if ($i % 2 == 0)
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -50-(16*($i-2)), -8, -22-(16*($i-2)), -5);			# in0 signal rail
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -26-(16*($i-2)), -5, -22-(16*($i-2)), -2);			# in0 signal connect
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -50-(16*($i-2)), -5, -46-(16*($i-2)), -2);			# in0 signal connect
		}
		else
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -34-(16*($i-1)), 5, -6-(16*($i-1)), 8);			# in1 signal rail
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -10-(16*($i-1)), 2, -6-(16*($i-1)), 5);			# in1 signal connect
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -34-(16*($i-1)), 2, -30-(16*($i-1)), 5);			# in1 signal connect
		}
		$i++;
	}
	$i = 0;
	until ($i == $pfoldsn + 1)
	{
		if ($i % 2 == 0)
		{
			if (28+$delta_ph-$psize_eachn > 24)	# if active stops short of out rail
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda,
				  -22-(16*$i), 28+$delta_ph-$psize_eachn, -18-(16*$i), 37+$delta_ph);				# vdd connects
			}
			else
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -22-(16*$i), 24, -18-(16*$i), 37+$delta_ph);	# vdd connects
			}
			if ($i == 0)
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -6-(16*($i)), 21, -2-(16*($i)), 28+$delta_ph);	# out connects
			}
		}
		else
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -38-(16*($i-1)), 21, -34-(16*($i-1)), 28+$delta_ph);	# out connects
		}
		$i++;
	}
	$i = 0;
	until ($i == $nfoldsn + 1)
	{
		if (-28-$delta_nh+$nsize_eachn < -24)	# if active stops short of out rail
		{
			if ($i == 0)
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda,
				  -6, -37-$delta_nh, -2, -28-$delta_nh+$nsize_eachn);
			}
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda,
			  -22-(16*$i), -37-$delta_nh, -18-(16*$i), -28-$delta_nh+$nsize_eachn);	
		}
		else
		{
			if ($i == 0)
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -6, -37-$delta_nh, -2, -24);
			}
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -22-(16*$i), -37-$delta_nh, -18-(16*$i), -24);
		}
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -14-(16*$i), -28-$delta_nh, -10-(16*$i), -21);
		$i++;
	}
## CP
	print $lefhandle "    LAYER cp ;\n";
	# AOI
	$i = 0;
	if ($max_folds == 0)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 7, -1, 9, 1);
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 15, -1, 17, 1);
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 23, -1, 25, 1);
	}
	until ($i == ($max_folds * ($pins - 1)) + 3)
	{
		if (!(($i >= $max_folds * ($pins - 1)) && ($nfolds == 0) && ($pfolds == 0)))
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 7+(8*$i), -1, 9+(8*$i), 1);	
		}
		$i++;
	}
	# NOR
	$i = 0;
	if ($max_foldsn == 0)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -9, -1, -7, 1);
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -17, -1, -15, 1);
	}
	until ($i == ($max_foldsn * ($pinsn - 1)) + 2)
	{
		if (!(($i >= $max_foldsn * ($pinsn - 1)) && ($nfoldsn == 0) && ($pfoldsn == 0)))
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -9-(8*$i), -1, -7-(8*$i), 1);	
		}
		$i++;
	}
## CA
	print $lefhandle "    LAYER ca ;\n";
	# AOI
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 3, 25+$delta_ph, 5, 27+$delta_ph);	
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 3, -27-$delta_nh, 5, -25-$delta_nh);	
	$i = 0;
	until ($i >= $width)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 3+($i), 38+$delta_ph, 5+($i), 40+$delta_ph);	
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 3+($i), -40-$delta_nh, 5+($i), -38-$delta_nh);	
		$i+=8;
	}
	$i = 0;
	until ($i == $pfolds + 1)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 27+(24*$i), 25+$delta_ph, 29+(24*$i), 27+$delta_ph);	
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 11+(24*$i), 25+$delta_ph, 13+(24*$i), 27+$delta_ph);	
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 19+(24*$i), 25+$delta_ph, 21+(24*$i), 27+$delta_ph);	
		$i++;
	}
	$i = 0;
	until ($i == $nfolds + 1)
	{
		if ($i % 2 == 0)
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 27+(24*$i), -27-$delta_nh, 29+(24*$i), -25-$delta_nh);
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 11+(24*$i), -27-$delta_nh, 13+(24*$i), -25-$delta_nh);
		}
		else
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda,
			  51+(24*($i-1)), -27-$delta_nh, 53+(24*($i-1)), -25-$delta_nh);
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda,
			  43+(24*($i-1)), -27-$delta_nh, 45+(24*($i-1)), -25-$delta_nh);
		}
		$i++;
	}
	# NOR
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -5, 25+$delta_ph, -3, 27+$delta_ph);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -5, -27-$delta_nh, -3, -25-$delta_nh);
	$i = 0;
	until ($i >= $widthn)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -5-($i), 38+$delta_ph, -3-($i), 40+$delta_ph);
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -5-($i), -40-$delta_nh, -3-($i), -38-$delta_nh);
		$i+=8;
	}
	$i = 0;
	until ($i == $pfoldsn + 1)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -21-(16*$i), 25+$delta_ph, -19-(16*$i), 27+$delta_ph);
		$i++;
	}
	$i = 0;
	until ($i == $nfoldsn + 1)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -13-(16*$i), -27-$delta_nh, -11-(16*$i), -25-$delta_nh);
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -21-(16*$i), -27-$delta_nh, -19-(16*$i), -25-$delta_nh);
		$i ++;
	}
## VIA
	print $lefhandle "    LAYER via ;\n";
	# COM
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -9, -1, -7, 1);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 23, -1, 25, 1);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 39+$delta_width, -1, 41+$delta_width, 1);

	printf $lefhandle "  END\nEND $cell_name\n";
}

1

