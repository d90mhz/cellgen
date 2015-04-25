#!/usr/local/bin/perl -w


sub nand2	# parameters: lef filehandle, cell name, lambda, height, ratio, psize, nsize
{
	my $lefhandle = shift @_;
	my $cell_name = shift @_;
	my $lambda = shift @_;
	my $height = shift @_;
	my $ratio = shift @_;
	my $psize = shift @_;
	my $nsize = shift @_;
	
	my $pins = 3;
	my $min_height = 5.04;
	my $max_psize_min = 1.445;
	my $max_nsize_min = .945;
	
	my @coords = (0, 0, 0, 0);
	my @lcoords = (0, 0, 0, 0);
	my @ccoords = (0, 0, 0, 0);
	my ($delta_ph, $delta_nh, $pfolds, $nfolds, $max_folds, $psize_each, $nsize_each, $delta_width, $width)
	  = calc ($lambda, $height, $ratio, $pins, $min_height, $psize, $nsize, $max_psize_min, $max_nsize_min);

	print $lefhandle "MACRO $cell_name\n  CLASS CORE ;\n";
	@lcoords = lefcoords ($lambda, -.36-.72*$max_folds, -2.27, 1.8+.72*$max_folds, 2.77);			# cell boundary
	printf $lefhandle "  FOREIGN $cell_name %.3f %.3f ;\n", $lcoords[0], $lcoords[1];
	printf $lefhandle "  ORIGIN %.3f %.3f ;\n", - $lcoords[0], - $lcoords[1];
	printf $lefhandle "  SIZE %.3f BY %.3f ;\n", $lcoords[2] - $lcoords[0], $lcoords[3] - $lcoords[1];
	print $lefhandle "  SYMMETRY X Y ;\n  SITE CoreSite ;\n";
	print $lefhandle "  PIN vdd!\n    DIRECTION INOUT ;\n    USE POWER ;\n    SHAPE ABUTMENT ;\n";
	print $lefhandle "    PORT\n    LAYER METAL1 ;\n";
	@lcoords = lefcoords ($lambda, -.36-.72*$max_folds, 2.37, 1.8+.72*$max_folds, 3.17);		# pin vdd!
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END vdd!\n  PIN gnd!\n    DIRECTION INOUT ;\n    USE GROUND ;\n    SHAPE ABUTMENT ;\n ";
	print $lefhandle "   PORT\n    LAYER METAL1 ;\n";
	@lcoords = lefcoords ($lambda, -.36-.72*$max_folds, -2.67, 1.8+.72*$max_folds, -1.87);		# pin gnd!
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END gnd!\n  PIN out\n    DIRECTION OUTPUT ;\n    PORT\n    LAYER METAL2 ;\n";
	@lcoords = lefcoords ($lambda, 1.3, -.06, 1.585, .32);				# pin out
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END out\n  PIN in0\n    DIRECTION INPUT ;\n    PORT\n    LAYER METAL2 ;\n";
	@lcoords = lefcoords ($lambda, .555, -.01, .935, .27);				# pin in0
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END in0\n  PIN in1\n    DIRECTION INPUT ;\n    PORT\n    LAYER METAL2 ;\n";
	@lcoords = lefcoords ($lambda, -.165, -.01, .215, .27);				# pin in1
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END in1\n";

######## METAL2 SHIELD STRIPES AS PINS ###################
#	$i = 0;
#	$j = 0;
#	until ($i >= $width + 16)
#	{
#		print $lefhandle "  PIN shield_$j\n    DIRECTION INOUT ;\n    PORT\n    LAYER METAL2 ;\n";
#		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -6-($i), -24-$delta_nh, -2-($i), 24+$delta_ph);			# shield stripes
#		print $lefhandle "    END\n  END shield_$j\n";
#		$j++;
#		$i+=16;
#	}
##########################################################
	print $lefhandle "  OBS\n";

######## NWELL
	print $lefhandle "    LAYER NWELL ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.79-.29-.72*$max_folds, 0, 2.23+.29+.72*$max_folds, 3.31);		# NWELL

######## NIMP
	print $lefhandle "    LAYER NIMP ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.39-.72*$nfolds, -1.725, 1.83+.72*$nfolds, 0);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.46-.72*$max_folds, 2.225, 1.9+.72*$max_folds, 2.99);

######## PIMP
	print $lefhandle "    LAYER PIMP ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.39-.72*$pfolds, 0, 1.83+.72*$pfolds, 2.225);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.46-.72*$max_folds, -2.49, 1.9+.72*$max_folds, -1.725);

######## N2V
	print $lefhandle "    LAYER N2V ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.39-.72*$nfolds, -1.725, 1.83+.72*$nfolds, 0);


######## P2V
	print $lefhandle "    LAYER P2V ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.39-.72*$pfolds, 0, 1.83+.72*$pfolds, 2.225);


######## DIFF
	print $lefhandle "    LAYER DIFF ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.36-.72*$max_folds, 2.325, 1.8+.72*$max_folds, 2.88);	# NDIFF for vdd
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.21-.72*$nfolds, -.905-(floor(100*$nsize_each)/200), 1.65+.72*$nfolds, -.905+(floor((100*$nsize_each)+.5)/200));	# NDIFF for nmos

	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.36-.72*$max_folds, -2.38, 1.8+.72*$max_folds, -1.825);	# PDIFF for gnd
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.21-.72*$pfolds, 1.15-(floor(100*$psize_each)/200), 1.65+.72*$pfolds, 1.15+(floor((100*$psize_each)+.5)/200));	# PDIFF for pmos

######## POLY1
	print $lefhandle "    LAYER POLY1 ;\n";
	$i = 0;
	until ($i == ($pfolds + 1))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+(.72*(-$i)), 0, .45+(.72*(-$i)), 1.15+(floor((100*$psize_each)+.5)/200)+.22);		# pmos gate left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+(.72*($i+1)), 0, .45+(.72*($i+1)), 1.15+(floor((100*$psize_each)+.5)/200)+.22);	# pmos gate right
		if ($i != 0)
		{
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .99+(.72*(-$i-1)), -.33, 1.17+(.72*(-$i)), .33);	# pmos gate interconnect left
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+(.72*($i)), -.33, .45+(.72*($i+1)), .33);		# pmos gate interconnect right
		}
		$i++;
	}
	$i = 0;
	until ($i == ($nfolds + 1))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+(.72*(-$i)), -.905-(floor(100*$nsize_each)/200)-.22, .45+(.72*(-$i)), 0);	# nmos gate left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+(.72*($i+1)), -.905-(floor(100*$nsize_each)/200)-.22, .45+(.72*($i+1)), 0);	# nmos gate right
		if ($i != 0)
		{
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .99+(.72*(-$i-1)), -.33, 1.17+(.72*(-$i)), .33);	# nmos gate interconnect left
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+(.72*($i)), -.33, .45+(.72*($i+1)), .33);		# nmos gate interconnect right
		}
		$i++;
	}
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.02, -.13, .4, .29);			# in0 poly pad
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.02+.72, -.13, .4+.72, .29);	# in1 poly pad

######## METAL1
	print $lefhandle "    LAYER METAL1 ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.36-.72*$max_folds, 2.37, 1.8+.72*$max_folds, 3.17);			# vdd metal
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.36-.72*$max_folds, -2.67, 1.8+.72*$max_folds, -1.87);		# gnd metal
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.165, -.1, .305, .335);					# in0 pin pad
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .555, -.1, 1.025, .335);					# in1 pin pad
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 1.255, -.01, 1.635, .27);					# out pin pad


	## m1 for pmos side ######
	$i = 0;
	until ($i >= ($pfolds + 2))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+(.72*(-$i)), 1.035, .89+(.72*(-$i)), 1.265);	# contact cover left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+(.72*$i), 1.035, .89+(.72*$i), 1.265);	# contact cover right
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+(.72*(-$i)), 1.15, .835+(.72*(-$i)), 2.77);	# contact to vdd left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+(.72*$i), 1.15, .835+(.72*$i), 2.77);	# contact to vdd right
		$i++;
		if ($i < ($pfolds + 2))
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+(.72*(-$i)), 1.035, .89+(.72*(-$i)), 1.265);	# contact cover left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+(.72*$i), 1.035, .89+(.72*$i), 1.265);	# contact cover right
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+(.72*(-$i)), .565, .835+(.72*(-$i)), 1.15);		# contact to out left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+(.72*$i), 0, .835+(.72*$i), 1.15);		# contact to out right
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.115+.72+(.72*(-$i)), .565, 1.555+.72+(.72*(-$i)), .795);	# out interconnect left
			if ($i != 1)
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+.72+(.72*$i), -.01, .115+.72+(.72*$i), .22);	# out interconnect right
			}
		}
		$i++;
	}

	## m1 for nmos side ######
	$i = 0;
	until ($i >= ($nfolds + 2))
	{
		if ($nfolds != 0)
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+(.72*(-$i)), -1.02, .89+(.72*(-$i)), -.79);	# contact cover left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+(.72*$i), -1.02, .89+(.72*$i), -.79);	# contact cover right
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+(.72*(-$i)), -.905, .835+(.72*(-$i)), -.33);	# contact to node left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+(.72*$i), -1.63, .835+(.72*$i), -.905);	# contact to node right
		}
		if ($i != 0)
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+(.72*(-$i)), -.56, 2.275+(.72*(-$i)), -.33);	# node interconnect left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.835+(.72*$i), -1.63, .835+(.72*$i), -1.4);	# node interconnect right
		}
		$i++;
		if ($i < ($nfolds + 2))
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+(.72*(-$i)), -1.02, .89+(.72*(-$i)), -.79);	# contact cover left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+(.72*$i), -1.02, .89+(.72*$i), -.79);	# contact cover right
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+(.72*(-$i)), -2.27, .835+(.72*(-$i)), -.905);	# contact to gnd left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+(.72*$i), -.905, .835+(.72*$i), 0);	# contact to out right
			if ($i != 1)
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+.72+(.72*$i), -.01, .115+.72+(.72*$i), .22);	# out interconnect right
			}
		}
		$i++;
	}
######## METAL2
	print $lefhandle "    LAYER METAL2 ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 1.3, -.06, 1.585, .32);		# out metal
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.165, -.01, .215, .27);		# in0 metal
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .555, -.01, .935, .27);		# in1 metal

######## CONTACTS
	print $lefhandle "    LAYER CONT ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .08, -.03, .30, .19);		   # in0 contact
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .08+.72, -.03, .30+.72, .19);  # in1 contact
	$i = 0;
	until ($i == ($max_folds + 2))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+(.72*(-$i)), 2.425, .83+(.72*(-$i)), 2.645);	# vdd contacts left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+(.72*$i), 2.425, .83+(.72*$i), 2.645);	# vdd contacts right
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+(.72*(-$i)), -2.145, .83+(.72*(-$i)), -1.925);	# gnd contacts left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+(.72*$i), -2.145, .83+(.72*$i), -1.925);	# gnd contacts right
		$i++;
	}

	$i = 0;
	until ($i >= ($pfolds + 2))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+(.72*(-$i)), 1.04, .83+(.72*(-$i)), 1.26);	# pmos contacts left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+(.72*$i), 1.04, .83+(.72*$i), 1.26);	# pmos contacts right
		$i++;
	}

	$i = 0;
	until ($i >= ($nfolds + 2))
	{
		if (($i != 0) || ($nfolds != 0))
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+(.72*(-$i)), -1.015, .83+(.72*(-$i)), -.795);	# nmos contacts left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+(.72*$i), -1.015, .83+(.72*$i), -.795);	# nmos contacts right
		}
		$i++;
	}

######## VIA
	print $lefhandle "    LAYER VIA12 ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, 1.315, 0, 1.575, .26);	# out via						# in0 pin
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.105, 0, .155, .26);		# in0 via						# out pin
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .615, 0, .875, .26);		# in1 via						# out pin

	printf $lefhandle "  END\nEND $cell_name\n";
}

1
