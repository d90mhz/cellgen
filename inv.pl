#!/usr/local/bin/perl -w


sub inv		# parameters: lef filehandle, cell name, lambda, height, ratio, psize, nsize
{
	my $lefhandle = shift @_;
	my $cell_name = shift @_;
	my $lambda = shift @_;
	my $height = shift @_;
	my $ratio = shift @_;
	my $psize = shift @_;
	my $nsize = shift @_;
	
	my $pins = 2;
	my $min_height = 5.04;
	my $max_psize_min = 1.445;
	my $max_nsize_min = .945;
	
	my @coords = (0, 0, 0, 0);
	my @lcoords = (0, 0, 0, 0);
	my @ccoords = (0, 0, 0, 0);
	my ($delta_ph, $delta_nh, $pfolds, $nfolds, $max_folds, $psize_each, $nsize_each, $delta_width, $width)
	  = calc ($lambda, $height, $ratio, $pins, $min_height, $psize, $nsize, $max_psize_min, $max_nsize_min);

	print $lefhandle "MACRO $cell_name\n  CLASS CORE ;\n";
	@lcoords = lefcoords ($lambda, -.36, -2.27, 1.08+.72*$max_folds, 2.77);			# cell boundary
	printf $lefhandle "  FOREIGN $cell_name %.3f %.3f ;\n", $lcoords[0], $lcoords[1];
	printf $lefhandle "  ORIGIN %.3f %.3f ;\n", - $lcoords[0], - $lcoords[1];
	printf $lefhandle "  SIZE %.3f BY %.3f ;\n", $lcoords[2] - $lcoords[0], $lcoords[3] - $lcoords[1];
	print $lefhandle "  SYMMETRY X Y ;\n  SITE CoreSite ;\n";
	print $lefhandle "  PIN vdd!\n    DIRECTION INOUT ;\n    USE POWER ;\n    SHAPE ABUTMENT ;\n";
	print $lefhandle "    PORT\n    LAYER METAL1 ;\n";
	@lcoords = lefcoords ($lambda, -.36, 2.37, 1.08+.72*$max_folds, 3.17);		# pin vdd!
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END vdd!\n  PIN gnd!\n    DIRECTION INOUT ;\n    USE GROUND ;\n    SHAPE ABUTMENT ;\n ";
	print $lefhandle "   PORT\n    LAYER METAL1 ;\n";
	@lcoords = lefcoords ($lambda, -.36, -2.67, 1.08+.72*$max_folds, -1.87);		# pin gnd!
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END gnd!\n  PIN out\n    DIRECTION OUTPUT ;\n    PORT\n    LAYER METAL2 ;\n";
	@lcoords = lefcoords ($lambda, .58, -.06, .865, .32);				# pin out
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END out\n  PIN in0\n    DIRECTION INPUT ;\n    PORT\n    LAYER METAL2 ;\n";
	@lcoords = lefcoords ($lambda, -.165, -.01, .215, .27);				# pin in0
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END in0\n";

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
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.79-.29, 0, 1.51+.29+.72*$max_folds, 3.31);		# NWELL

######## NIMP
	print $lefhandle "    LAYER NIMP ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.39, -1.725, 1.11+.72*$nfolds, 0);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.46, 2.225, 1.18+.72*$max_folds, 2.99);

######## PIMP
	print $lefhandle "    LAYER PIMP ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.39, 0, 1.11+.72*$pfolds, 2.225);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.46, -2.49, 1.18+.72*$max_folds, -1.725);

######## N2V
	print $lefhandle "    LAYER N2V ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.39, -1.725, 1.11+.72*$nfolds, 0);

######## P2V
	print $lefhandle "    LAYER P2V ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.39, 0, 1.11+.72*$pfolds, 2.225);

######## DIFF
	print $lefhandle "    LAYER DIFF ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.36, 2.325, 1.08+.72*$max_folds, 2.88);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.21, -.905-(floor(100*$nsize_each)/200), .93+.72*$nfolds, -.905+(floor((100*$nsize_each)+.5)/200));

	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.36, -2.38, 1.08+.72*$max_folds, -1.825);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.21, 1.15-(floor(100*$psize_each)/200), .93+.72*$pfolds, 1.15+(floor((100*$psize_each)+.5)/200));

######## POLY1
	print $lefhandle "    LAYER POLY1 ;\n";
	$i = 0;
	until ($i == ($pfolds * ($pins - 1)) + 1)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+(.72*$i), 0, .45+(.72*$i), 1.15+(floor((100*$psize_each)+.5)/200)+.22);
		if ($i != 0)
		{
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+(.72*($i-1)), -.33, .45+(.72*$i), .33);
		}
		$i++;
	}
	$i = 0;
	until ($i == ($nfolds * ($pins - 1)) + 1)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+(.72*$i), -.905-(floor(100*$nsize_each)/200)-.22, .45+(.72*$i), 0);
		if ($i != 0)
		{
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+(.72*($i-1)), -.33, .45+(.72*$i), .33);
		}
		$i++;
	}
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.02, -.13, .4, .29);

######## METAL1
	print $lefhandle "    LAYER METAL1 ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.36, 2.37, 1.08+.72*$max_folds, 3.17);			# vdd metal
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.36, -2.67, 1.08+.72*$max_folds, -1.87);		# gnd metal
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.165, -.1, .305, .335);					# in pin pad
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .535, -.01, .915, .27);					# out pin pad


	## m1 for pmos side ######
	$i = 0;
	until ($i >= ($pfolds * ($pins - 1)) + 2)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.17+(.72*$i), 1.035, .17+(.72*$i), 1.265);	# contact cover
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.115+(.72*$i), 1.15, .115+(.72*$i), 2.77);	# contact to vdd
		$i++;
		if ($i < ($pfolds * ($pins - 1)) + 2)
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.17+(.72*$i), 1.035, .17+(.72*$i), 1.265);	# contact cover
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.115+(.72*$i), 0, .115+(.72*$i), 1.15);	# contact to out
			if ($i != 1)
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+(.72*$i), -.09, .115+(.72*$i), .14);	# out interconnect
			}
		}
		$i++;
	}

	## m1 for nmos side ######
	$i = 0;
	until ($i >= ($nfolds * ($pins - 1)) + 2)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.17+(.72*$i), -1.02, .17+(.72*$i), -.79);	# contact cover
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.115+(.72*$i), -2.27, .115+(.72*$i), -.905);	# contact to gnd
		$i++;
		if ($i < ($nfolds * ($pins - 1)) + 2)
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.17+(.72*$i), -1.02, .17+(.72*$i), -.79);	# contact cover
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.115+(.72*$i), -.905, .115+(.72*$i), 0);	# contact to out
			if ($i != 1)
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+(.72*$i), -.09, .115+(.72*$i), .14);	# out interconnect
			}
		}
		$i++;
	}
######## METAL2
	print $lefhandle "    LAYER METAL2 ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .58, -.06, .865, .32);		# out metal
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.165, -.01, .215, .27);		# in0 metal

######## CONTACTS
	print $lefhandle "    LAYER CONT ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .08, -.03, .30, .19);		   # in contact
	$i = 0;
	until ($i == ($max_folds * ($pins - 1)) + 2)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.11+(.72*$i), 2.425, .11+(.72*$i), 2.645);	# vdd contacts
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.11+(.72*$i), -2.145, .11+(.72*$i), -1.925);	# gnd contacts
		$i++;
	}

	$i = 0;
	until ($i >= ($pfolds * ($pins - 1)) + 2)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.11+(.72*$i), 1.04, .11+(.72*$i), 1.26);	# pmos contacts
		$i++;
	}

	$i = 0;
	until ($i >= ($nfolds * ($pins - 1)) + 2)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.11+(.72*$i), -1.015, .11+(.72*$i), -.795);	# nmos contacts
		$i++;
	}

######## VIA
	print $lefhandle "    LAYER VIA12 ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.105, 0, .155, .26);		# in0 via						# out pin
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .595, 0, .855, .26);		# out via						# in0 pin

	printf $lefhandle "  END\nEND $cell_name\n";
}

1
