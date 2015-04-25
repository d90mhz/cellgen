#!/usr/local/bin/perl -w


sub xor2	# parameters: lef filehandle, cell name, lambda, height, ratio, psize, nsize
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
	my $min_height = 5.04;
	my $max_psize_min = 1.445;
	my $max_nsize_min = .945;
	
	my @coords = (0, 0, 0, 0);
	my @lcoords = (0, 0, 0, 0);
	my @ccoords = (0, 0, 0, 0);
	my ($delta_ph, $delta_nh, $pfolds, $nfolds, $max_folds, $psize_each, $nsize_each, $delta_width, $width)
	  = calc ($lambda, $height, $ratio, $pins, $min_height, $psize, $nsize, $max_psize_min, $max_nsize_min);
	
	my ($delta_phn, $delta_nhn, $pfoldsn, $nfoldsn, $max_foldsn, $psize_eachn, $nsize_eachn, $delta_widthn, $widthn)
	  = calc ($lambda, $height, $ratio, $pinsn, $min_height, $psizen, $nsizen, $max_psize_min, $max_nsize_min);

#### IMPORTANT NOTE: MUST USE SINGE DELTA_NH AND DELTA_PH ... CELL HEIGHT IS CONSTANT ACROSS AOI AND NOR !!!!
####  THIS EFFECTIVELY MEANS DELTA_PHN AND DELTA_NHN ARE NOT USED BEYOND THIS POINT

	my $adjust = (isodd($nfolds) && ($nfolds >= $pfolds));

	my $pitch = .72;
	my $nor_shift = $pitch*(2*($max_folds+1)+$adjust+1+$max_foldsn+1);

	my $bound_l = -.36;
	my $bound_r = 1.8;
	my $bound_b = -2.27;
	my $bound_t = 2.77;

	my $vdd_l = $bound_l;
	my $vdd_r = $bound_r;
	my $vdd_b = 2.37;
	my $vdd_t = 3.17;

	my $gnd_l = $bound_l;
	my $gnd_r = $bound_r;
	my $gnd_b = -2.67;
	my $gnd_t = -1.87;

	my $pin_l = -.22;
	my $pin_r = .22;
	my $pin_b = -.14;
	my $pin_t = .32;

	print $lefhandle "MACRO $cell_name\n  CLASS CORE ;\n";
	@lcoords = lefcoords ($lambda, $bound_l-$pitch*($max_folds), $bound_b, $bound_r+$pitch*(2*$max_folds+$adjust+1+2*($max_foldsn+1)+1), $bound_t);			# cell boundary
	printf $lefhandle "  FOREIGN $cell_name %.3f %.3f ;\n", $lcoords[0], $lcoords[1];
	printf $lefhandle "  ORIGIN %.3f %.3f ;\n", - $lcoords[0], - $lcoords[1];
	printf $lefhandle "  SIZE %.3f BY %.3f ;\n", $lcoords[2] - $lcoords[0], $lcoords[3] - $lcoords[1];
	print $lefhandle "  SYMMETRY X Y ;\n  SITE CoreSite ;\n";
	print $lefhandle "  PIN vdd!\n    DIRECTION INOUT ;\n    USE POWER ;\n    SHAPE ABUTMENT ;\n";
	print $lefhandle "    PORT\n    LAYER METAL1 ;\n";
	@lcoords = lefcoords ($lambda, $vdd_l-$pitch*($max_folds), $vdd_b, $vdd_r+$pitch+$pitch*(2*$max_folds+$adjust+2*($max_foldsn+1)+1), $vdd_t);		# pin vdd!
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END vdd!\n  PIN gnd!\n    DIRECTION INOUT ;\n    USE GROUND ;\n    SHAPE ABUTMENT ;\n ";
	print $lefhandle "   PORT\n    LAYER METAL1 ;\n";
	@lcoords = lefcoords ($lambda, $gnd_l-$pitch*($max_folds), $gnd_b, $gnd_r+$pitch+$pitch*(2*$max_folds+$adjust+2*($max_foldsn+1)+1), $gnd_t);		# pin gnd!
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END gnd!\n  PIN out\n    DIRECTION OUTPUT ;\n    PORT\n    LAYER METAL2 ;\n";
	@lcoords = lefcoords ($lambda, $pin_l, $pin_b, $pin_r, $pin_t);				# pin out
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END out\n  PIN in0\n    DIRECTION INPUT ;\n    PORT\n    LAYER METAL2 ;\n";
	@lcoords = lefcoords ($lambda, $pin_l+$pitch*($max_folds+2), $pin_b, $pin_r+$pitch*($max_folds+2), $pin_t);	# pin in0
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END in0\n  PIN in1\n    DIRECTION INPUT ;\n    PORT\n    LAYER METAL2 ;\n";
	@lcoords = lefcoords ($lambda, $pin_l+$nor_shift, $pin_b, $pin_r+$nor_shift, $pin_t);				# pin in1
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END in1\n  PIN in2\n    DIRECTION INPUT ;\n    PORT\n    LAYER METAL2 ;\n";
	@lcoords = lefcoords ($lambda, $pin_l+$pitch+$nor_shift, $pin_b, $pin_r+$pitch+$nor_shift, $pin_t);				# pin in2
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END in3\n";

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
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.79-.29-$pitch*$max_folds, 0, 2.23+.29+$pitch*$max_foldsn+$nor_shift, 3.31);		# NWELL

######## NIMP
	print $lefhandle "    LAYER NIMP ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.39-$pitch*$nfolds, -1.725, 1.83+$pitch*$nfoldsn+$nor_shift, 0);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.46-$pitch*$max_folds, 2.225, 1.9+$pitch*$max_foldsn+$nor_shift, 2.99);

######## PIMP
	print $lefhandle "    LAYER PIMP ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.39-$pitch*$pfolds, 0, 1.83+$pitch*$pfoldsn+$nor_shift, 2.225);
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.46-$pitch*$max_folds, -2.49, 1.9+$pitch*$max_foldsn+$nor_shift, -1.725);

######## N2V
	print $lefhandle "    LAYER N2V ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.39-$pitch*$nfolds, -1.725, 1.83+$pitch*$nfoldsn+$nor_shift, 0);


######## P2V
	print $lefhandle "    LAYER P2V ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.39-$pitch*$pfolds, 0, 1.83+$pitch*$pfoldsn+$nor_shift, 2.225);

######## DIFF
	print $lefhandle "    LAYER DIFF ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.36-$pitch*$max_folds, 2.325, 1.8+$pitch*$max_foldsn+$nor_shift, 2.88);	# NDIFF for vdd
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.36-$pitch*$max_folds, -2.38, 1.8+$pitch*$max_foldsn+$nor_shift, -1.825);	# PDIFF for gnd

	### DIFF AOI
	my $ndiff_b = 0;
	my $ndiff_t = 0;
	my $pdiff_b = 0;
	my $pdiff_t = 0;

	if ($nsize_each > .62)
		{
			$ndiff_b = -1.375;
			$ndiff_t = -1.375+$nsize_each;
		}
		else
		{
			$ndiff_b = -1.065-(floor(100*$nsize_each)/200);
			$ndiff_t = -1.065+(floor((100*$nsize_each)+.5)/200);
		}

	if ($psize_each > .62)
		{
			$pdiff_b = 1.875-$psize_each;
			$pdiff_t = 1.875;
		}
		else
		{
			$pdiff_b = 1.565-(floor(100*$psize_each)/200);
			$pdiff_t = 1.565+(floor((100*$psize_each)+.5)/200);
		}

	if (iseven($nfolds))
	{	
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.21-$pitch*$nfolds, $ndiff_b, 1.65+$pitch*$max_folds, $ndiff_t);	# NDIFF for nmos middle if connected
	}
	else
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.21-$pitch*$nfolds, $ndiff_b, 1.65+$pitch*$nfolds, $ndiff_t);	# NDIFF for nmos middle if not connected
	}
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.21+$pitch+$pitch*($max_folds+1+$adjust), $ndiff_b, 1.65+$pitch+$pitch*($max_folds+$nfolds+$adjust), $ndiff_t);	# NDIFF for nmos right

	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.21-$pitch*$pfolds, $pdiff_b, 1.65+$pitch*($max_folds+$adjust+$pfolds+1), $pdiff_t);	# PDIFF for pmos

	### DIFF NOR
	my $ndiffn_b = 0;
	my $ndiffn_t = 0;
	my $pdiffn_b = 0;
	my $pdiffn_t = 0;

	if ($nsize_eachn > .62)
		{
			$ndiffn_b = -1.375;
			$ndiffn_t = -1.375+$nsize_eachn;
		}
		else
		{
			$ndiffn_b = -1.065-(floor(100*$nsize_eachn)/200);
			$ndiffn_t = -1.065+(floor((100*$nsize_eachn)+.5)/200);
		}

	if ($psize_eachn > .62)
		{
			$pdiffn_b = 1.875-$psize_eachn;
			$pdiffn_t = 1.875;
		}
		else
		{
			$pdiffn_b = 1.565-(floor(100*$psize_eachn)/200);
			$pdiffn_t = 1.565+(floor((100*$psize_eachn)+.5)/200);
		}

	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.21-$pitch*$nfoldsn+$nor_shift, $ndiffn_b, 1.65+$pitch*$nfoldsn+$nor_shift, $ndiffn_t);	# NDIFF for nmos

	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.21-$pitch*$pfoldsn+$nor_shift, $pdiffn_b, 1.65+$pitch*$pfoldsn+$nor_shift, $pdiffn_t);	# PDIFF for pmos

######## POLY1
	print $lefhandle "    LAYER POLY1 ;\n";
	#######  this adds the polys for in0 and in1
	my $npoly_b = 0;
	my $ppoly_t = 0;
	my $npolyn_b = 0;
	my $ppolyn_t = 0;

	$npoly_b = $ndiff_b - .22;
	$ppoly_t = $pdiff_t + .22;
	$npolyn_b = $ndiffn_b - .22;
	$ppolyn_t = $pdiffn_t + .22;

	$i = 0;
	until ($i == ($pfolds + 1))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+($pitch*(-$i)), 0, .45+($pitch*(-$i)), $ppoly_t);		# pmos gate left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+($pitch*($i+1)), 0, .45+($pitch*($i+1)), $ppoly_t);	# pmos gate right
		if ($i != 0)
		{
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .99+($pitch*(-$i-1)), -.33, 1.17+($pitch*(-$i)), .33);	# pmos gate interconnect left
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+($pitch*($i)), -.33, .45+($pitch*($i+1)), .33);		# pmos gate interconnect right
		}
		$i++;
	}
	$i = 0;
	until ($i == ($nfolds + 1))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+($pitch*(-$i)), $npoly_b, .45+($pitch*(-$i)), 0);		# nmos gate left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+($pitch*($i+1)), $npoly_b, .45+($pitch*($i+1)), 0);	# nmos gate right
		if ($i != 0)
		{
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .99+($pitch*(-$i-1)), -.33, 1.17+($pitch*(-$i)), .33);	# nmos gate interconnect left
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+($pitch*($i)), -.33, .45+($pitch*($i+1)), .33);		# nmos gate interconnect right
		}
		$i++;
	}
	#######  this adds the polys for 'aoi in2'
	$i = $max_folds+1+$adjust;
	until ($i == ($max_folds+1+$adjust + $pfolds + 1))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+($pitch*($i+1)), 0, .45+($pitch*($i+1)), $ppoly_t);	# pmos gate right
		if ($i != $max_folds+1+$adjust)
		{
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+($pitch*($i)), -.33, .45+($pitch*($i+1)), .33);		# pmos gate interconnect right
		}
		$i++;
	}
	$i = $max_folds+1+$adjust;
	until ($i == ($max_folds+1+$adjust + $nfolds + 1))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+($pitch*($i+1)), $npoly_b, .45+($pitch*($i+1)), 0);	# nmos gate right
		if ($i != $max_folds+1+$adjust)
		{
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+($pitch*($i)), -.33, .45+($pitch*($i+1)), .33);		# nmos gate interconnect right
		}
		$i++;
	}
	#######  this adds polys for the nor
	$i = 0;
	until ($i == ($pfoldsn + 1))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+($pitch*(-$i))+$nor_shift, 0, .45+($pitch*(-$i))+$nor_shift, $ppolyn_t);		# pmos gate left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+($pitch*($i+1))+$nor_shift, 0, .45+($pitch*($i+1))+$nor_shift, $ppolyn_t);	# pmos gate right
		if ($i != 0)
		{
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .99+($pitch*(-$i-1))+$nor_shift, -.33, 1.17+($pitch*(-$i))+$nor_shift, .33);	# pmos gate interconnect left
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+($pitch*($i))+$nor_shift, -.33, .45+($pitch*($i+1))+$nor_shift, .33);		# pmos gate interconnect right
		}
		$i++;
	}
	$i = 0;
	until ($i == ($nfoldsn + 1))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+($pitch*(-$i))+$nor_shift, $npolyn_b, .45+($pitch*(-$i))+$nor_shift, 0);	# nmos gate left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+($pitch*($i+1))+$nor_shift, $npolyn_b, .45+($pitch*($i+1))+$nor_shift, 0);	# nmos gate right
		if ($i != 0)
		{
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .99+($pitch*(-$i-1))+$nor_shift, -.33, 1.17+($pitch*(-$i))+$nor_shift, .33);	# nmos gate interconnect left
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+($pitch*($i))+$nor_shift, -.33, .45+($pitch*($i+1))+$nor_shift, .33);		# nmos gate interconnect right
		}
		$i++;
	}
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.02+$nor_shift, -.13, .4+$nor_shift, .29);			# in2 poly pad
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.02+$pitch+$nor_shift, -.13, .4+$pitch+$nor_shift, .29);		# in3 poly pad

	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .32, -.13, .74, .29);									# in0 poly pad
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .32+$pitch*($max_folds+1), -.13, .74+$pitch*($max_folds+1), .29);	# in1 poly pad
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .27+$pitch*2*($max_folds+1), -.33, .45+$pitch*(2*($max_folds+1)+$adjust+2), .33);		# nmos gate interconnect right

######## METAL1
	my $m1nmos_c = -1.065;
	my $m1pmos_c = 1.565;

	my $m1pin_l = -.305;
	my $m1pin_r = .165;
	my $m1pin_b = -.135;
	my $m1pin_t = .3;

	my $m1path_l = -.115;
	my $m1path_r = .115;

	my $m1path_gnd_c = -2.27;
	my $m1path_nb_b = -1.64;
	my $m1path_nb_t = -1.41;
	my $m1path_nc_b = -1.18;
	my $m1path_nc_t = -.95;
	my $m1path_nt_b = -.72;
	my $m1path_nt_t = -.49;
	my $m1path_p0_b = -.035;
	my $m1path_p0_t = .195;
	my $m1path_p1_b = .53;
	my $m1path_p1_t = .76;
	my $m1path_pb_b = .99;
	my $m1path_pb_t = 1.22;
	my $m1path_pc_b = 1.45;
	my $m1path_pc_t = 1.68;
	my $m1path_pt_b = 1.91;
	my $m1path_pt_t = 2.14;
	my $m1path_vdd_c = 2.77;


	print $lefhandle "    LAYER METAL1 ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.36-$pitch*$max_folds, 2.37, 1.8+$pitch*$max_foldsn+$nor_shift, 3.17);			# vdd metal
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.36-$pitch*$max_folds, -2.67, 1.8+$pitch*$max_foldsn+$nor_shift, -1.87);			# gnd metal
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $m1pin_l+$pitch, $m1pin_b+.045, $m1pin_r+$pitch-.24, $m1pin_t-.05);						# in0 pin pad
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $m1pin_l+$pitch*($max_folds+2), $m1pin_b, $m1pin_r+$pitch*($max_folds+2), $m1pin_t);	# in1 pin pad
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.195, -.045, .185, .235);											# out pin pad

		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $m1path_l, $m1path_nt_b, $m1path_r+$pitch*1, $m1path_nt_t);	# n-out interconnect
	if ($pfolds != 0)
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $m1path_l, $m1path_nt_b, $m1path_r, $m1path_p1_t);			# n-out to out to p-out
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $m1path_l, $m1path_p1_b, $m1path_r+$pitch*2-.465, $m1path_p1_t);	# p-out interconnect
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $m1path_l+$pitch*2-.465, $m1path_p1_b, $m1path_r+$pitch*2-.465, $m1path_pb_t);	# p-out interconnect up
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $m1path_l+$pitch*2-.465, $m1path_pb_b, $m1path_r+$pitch*2, $m1path_pb_t);	# p-out interconnect up
	}
	else
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $m1path_l, $m1path_nt_b, $m1path_r, $m1path_pb_t);			# n-out to out to p-out
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $m1path_l, $m1path_pb_b, $m1path_r+$pitch*2, $m1path_pb_t);	# p-out interconnect
	}
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $m1path_l+$pitch, $m1path_p0_b, $m1path_r+$pitch*($max_folds+1)+.07, $m1path_p0_t);	# nor out to aoi in bottom
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $m1path_l+$pitch*($max_folds+1)+.07, $m1path_p0_b, $m1path_r+$pitch*($max_folds+1)+.07, $m1path_p1_t);	# nor out to aoi in up
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $m1path_l+$pitch*($max_folds+1)+.07, $m1path_p1_b, $m1path_r+$pitch*2+$nor_shift, $m1path_p1_t);	# nor out to aoi in top

	## m1 for nmos side ######
	####### for in0 and in1
	$i = 0;
	until ($i >= ($max_folds + $adjust +2))
	{
		$i++;
		if (($i < ($max_folds + 2)) && ($max_folds != 0) && $i != 1)
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+($pitch*($i+1)), $m1path_nb_b, $m1path_r+($pitch*($i+1)), $m1path_nb_t);	# node right interconnect
		}
		$i++;
	}
	$i = 0;
	until ($i >= ($nfolds + 2))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*(-$i)), $m1path_nc_b, .89+($pitch*(-$i)), $m1path_nc_t);	# contact cover left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*$i), $m1path_nc_b, .89+($pitch*$i), $m1path_nc_t);		# contact cover right
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*(-$i)), $m1nmos_c, .835+($pitch*(-$i)), $m1path_nt_t);	# contact to out left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*$i), $m1nmos_c, .835+($pitch*$i), $m1path_nt_t);		# contact to out right
		if ($i != 0)
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $m1path_l+($pitch*(-$i+1)), $m1path_nt_b, 1.555+($pitch*(-$i+1)), $m1path_nt_t);	# out interconnect left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+($pitch*($i+1)), $m1path_nt_b, $m1path_r+($pitch*($i+1)), $m1path_nt_t);	# out interconnect right
		}
		$i++;
		if (($i < ($nfolds + 2)) && ($max_folds != 0))
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*(-$i)), $m1path_nc_b, .89+($pitch*(-$i)), $m1path_nc_t);	# contact cover left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*$i), $m1path_nc_b, .89+($pitch*$i), $m1path_nc_t);		# contact cover right
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*(-$i)), $m1path_gnd_c, .835+($pitch*(-$i)), $m1nmos_c);	# contact to node left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*$i), $m1path_nb_t, .835+($pitch*$i), $m1nmos_c);		# contact to node right
			if ($i != 1)
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+($pitch*($i+1)), $m1path_nb_b, $m1path_r+($pitch*($i+1)), $m1path_nb_t);	# node interconnect right
			}
		}
		$i++;
	}

	######### for in2 and in3
	$i = $max_folds + 1+$adjust;
	until ($i >= ($max_folds + 1+$adjust+$nfolds + 2))
	{
		if ($max_folds != 0)
		{		
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*$i), $m1path_nc_b, .89+($pitch*$i), $m1path_nc_t);	# contact cover right
		      if ($nfolds != 0)
		      {
		              printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*$i), $m1nmos_c, .835+($pitch*$i), $m1path_nt_t);	# contact to node right
              }
            if ($i == $max_folds + 1+$adjust)
		    {
			     printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*$i), $m1path_nb_t, .835+($pitch*$i), $m1nmos_c);	# contact to node right down
			     printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+($pitch*($i+1)), $m1path_nb_b, $m1path_r+($pitch*($i+1)), $m1path_nb_t);	# node interconnect right
		    }
		    else
		    {
			     printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+($pitch*($i+1)), $m1path_nt_b, $m1path_r+($pitch*($i+1)), $m1path_nt_t);	# node interconnect right
		    }
		}
		$i++;
		if ($i < ($max_folds + 1+$adjust+$nfolds + 2))
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*$i), $m1path_gnd_c, .835+($pitch*$i), $m1nmos_c);		# contact to gnd right
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*$i), $m1path_nc_b, .89+($pitch*$i), $m1path_nc_t);		# contact cover right
		}
		$i++;
	}

	
	## m1 for pmos side ######
	## for in0 and in1
	$i = 2;
	until ($i >= ($pfolds + 2))
	{
		if ($i != 2)
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $m1path_l-($pitch*($i-1)), $m1path_pb_b, 1.555-($pitch*($i-1)), $m1path_pb_t);	# node interconnect left
		}
		else
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $m1path_l-($pitch*($i-1)), $m1path_pb_b, 1.555-.205-($pitch*($i-1)), $m1path_pb_t);	# node interconnect left
		}
		$i++;
		$i++;
	}
	until ($i >= ($max_folds + $adjust + 2))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+($pitch*($i+1)), $m1path_pt_b, $m1path_r+($pitch*($i+1)), $m1path_pt_t);	# node interconnect right
		$i++;
		if ($i < ($max_folds + 2))
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+($pitch*($i+1)), $m1path_pb_b, $m1path_r+($pitch*($i+1)), $m1path_pb_t);	# out interconnect right
		}
		$i++;
	}
	$i = 0;
	until ($i >= ($pfolds + 2))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*(-$i)), $m1path_pc_b, .89+($pitch*(-$i)), $m1path_pc_t);	# contact cover left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*$i), $m1path_pc_b, .89+($pitch*$i), $m1path_pc_t);		# contact cover right
		if ($max_folds != 0)
		{
			if ($i != 0)
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*(-$i)), $m1path_pb_b, .835+($pitch*(-$i)), $m1pmos_c);	# contact to node left
			}
			else
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605-.205+($pitch*(-$i)), $m1path_pb_b, .835-.205+($pitch*(-$i)), $m1path_pc_t);	# contact to node left
			}
		}
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*$i), $m1path_pt_t, .835+($pitch*$i), $m1pmos_c);		# contact to node right
		if ($i != 0)
		{
			if ($i != 2)
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $m1path_l+($pitch*(-$i+1)), $m1path_pb_b, 1.555+($pitch*(-$i+1)), $m1path_pb_t);	# node1 interconnect left
			}
			else
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $m1path_l+($pitch*(-$i+1)), $m1path_pb_b, 1.555-.205+($pitch*(-$i+1)), $m1path_pb_t);	# node1 interconnect left
			}
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+($pitch*($i+1)), $m1path_pt_b, $m1path_r+($pitch*($i+1)), $m1path_pt_t);	# node1 interconnect right
		}
		$i++;
		if ($i < ($pfolds + 2))
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*(-$i)), $m1path_pc_b, .89+($pitch*(-$i)), $m1path_pc_t);	# contact cover left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*$i), $m1path_pc_b, .89+($pitch*$i), $m1path_pc_t);		# contact cover right
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*(-$i)), $m1pmos_c, .835+($pitch*(-$i)), $m1path_vdd_c);	# contact to vdd left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*$i), $m1path_pb_b, .835+($pitch*$i), $m1pmos_c);		# contact to out right
			if ($i != 1)
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+($pitch*($i+1)), $m1path_pb_b, $m1path_r+($pitch*($i+1)), $m1path_pb_t);	# out interconnect right
			}
		}
		$i++;
	}
	## for in2 and in3
	$i = $max_folds + 1+$adjust;
	until ($i >= ($max_folds + 1+$adjust+$pfolds + 2))
	{
		if (isodd($pfolds))
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*$i), $m1path_pc_b, .89+($pitch*$i), $m1path_pc_t);	# contact cover right
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*$i), $m1pmos_c, .835+($pitch*$i), $m1path_pt_t);	# contact to node right
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+($pitch*($i+1)), $m1path_pt_b, $m1path_r+($pitch*($i+1)), $m1path_pt_t);	# node interconnect right
			$i++;
			if ($i < ($max_folds + 1+$adjust+$pfolds + 2))
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*$i), $m1path_pc_b, .89+($pitch*$i), $m1path_pc_t);	# contact cover right
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*$i), $m1path_pb_b, .835+($pitch*$i), $m1pmos_c);	# contact to out right
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+($pitch*($i)), $m1path_pb_b, $m1path_r+($pitch*($i+1)), $m1path_pb_t);	# out interconnect right
			}
			$i++;
		}
		else
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*$i), $m1path_pc_b, .89+($pitch*$i), $m1path_pc_t);	# contact cover right
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*$i), $m1path_pb_b, .835+($pitch*$i), $m1pmos_c);	# contact to out right
			if ($max_folds != 0)
			{
			     printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+($pitch*($i+1)), $m1path_pb_b, $m1path_r+($pitch*($i+1)), $m1path_pb_t);	# out interconnect right
			}
			$i++;
			if ($i < ($max_folds + 1+$adjust+$pfolds + 2))
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*$i), $m1path_pc_b, .89+($pitch*$i), $m1path_pc_t);	# contact cover right
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*$i), $m1pmos_c, .835+($pitch*$i), $m1path_pt_t);	# contact to node right
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+($pitch*($i+1)), $m1path_pt_b, $m1path_r+($pitch*($i+1)), $m1path_pt_t);	# node interconnect right
			}
			$i++;
		}
	}


	### METAL1 for NOR
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.165+$nor_shift, $m1pin_b, .305+$nor_shift, $m1pin_t);					# in0 pin pad
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .555+$nor_shift, $m1pin_b, 1.025+$nor_shift, $m1pin_t);					# in1 pin pad


	## m1 for nmos side ######
	$i = 0;
	until ($i >= ($nfoldsn + 2))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*(-$i))+$nor_shift, $m1path_nc_b, .89+($pitch*(-$i))+$nor_shift, $m1path_nc_t);	# contact cover left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*$i)+$nor_shift, $m1path_nc_b, .89+($pitch*$i)+$nor_shift, $m1path_nc_t);	# contact cover right
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*(-$i))+$nor_shift, $m1path_gnd_c, .835+($pitch*(-$i))+$nor_shift, $m1nmos_c);	# contact to gnd left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*$i)+$nor_shift, $m1path_gnd_c, .835+($pitch*$i)+$nor_shift, $m1nmos_c);	# contact to gnd right
		$i++;
		if ($i < ($nfoldsn + 2))
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*(-$i))+$nor_shift, $m1path_nc_b, .89+($pitch*(-$i))+$nor_shift, $m1path_nc_t);	# contact cover left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*$i)+$nor_shift, $m1path_nc_b, .89+($pitch*$i)+$nor_shift, $m1path_nc_t);	# contact cover right
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*(-$i))+$nor_shift, $m1nmos_c, .835+($pitch*(-$i))+$nor_shift, $m1path_nt_t);		# contact to out left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*$i)+$nor_shift, $m1nmos_c, .835+($pitch*$i)+$nor_shift, 0);		# contact to out right
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $m1path_l+$pitch+($pitch*(-$i))+$nor_shift, $m1path_nt_b, 1.555+$pitch+($pitch*(-$i))+$nor_shift, $m1path_nt_t);	# out interconnect left
			if ($i != 1)
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+$pitch+($pitch*$i)+$nor_shift, -.01, $m1path_r+$pitch+($pitch*$i)+$nor_shift, .22);	# out interconnect right
			}
		}
		$i++;
	}

	## m1 for pmos side ######
	$i = 0;
	until ($i >= ($pfoldsn + 2))
	{
		if ($pfoldsn != 0)
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*(-$i))+$nor_shift, $m1path_pc_b, .89+($pitch*(-$i))+$nor_shift, $m1path_pc_t);	# contact cover left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*$i)+$nor_shift, $m1path_pc_b, .89+($pitch*$i)+$nor_shift, $m1path_pc_t);	# contact cover right
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*(-$i))+$nor_shift, $m1path_pb_b, .835+($pitch*(-$i))+$nor_shift, $m1pmos_c);	# contact to node left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*$i)+$nor_shift, $m1pmos_c, .835+($pitch*$i)+$nor_shift, $m1path_pt_t);	# contact to node right
		}
		if ($i != 0)
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*(-$i))+$nor_shift, $m1path_pb_b, 2.275+($pitch*(-$i))+$nor_shift, $m1path_pb_t);	# node interconnect left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.835+($pitch*$i)+$nor_shift, $m1path_pt_b, .835+($pitch*$i)+$nor_shift, $m1path_pt_t);	# node interconnect right
		}
		$i++;
		if ($i < ($pfoldsn + 2))
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*(-$i))+$nor_shift, $m1path_pc_b, .89+($pitch*(-$i))+$nor_shift, $m1path_pc_t);	# contact cover left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .55+($pitch*$i)+$nor_shift, $m1path_pc_b, .89+($pitch*$i)+$nor_shift, $m1path_pc_t);	# contact cover right
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*(-$i))+$nor_shift, $m1pmos_c, .835+($pitch*(-$i))+$nor_shift, $m1path_vdd_c);	# contact to vdd left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .605+($pitch*$i)+$nor_shift, 0, .835+($pitch*$i)+$nor_shift, $m1pmos_c);	# contact to out right
			if ($i != 1)
			{
				printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -1.555+$pitch+($pitch*$i)+$nor_shift, -.01, $m1path_r+$pitch+($pitch*$i)+$nor_shift, .22);	# out interconnect right
			}
		}
		$i++;
	}

######## METAL2
	print $lefhandle "    LAYER METAL2 ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $pin_l, $pin_b, $pin_r, $pin_t);				# pin out
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $pin_l+$pitch*($max_folds+2), $pin_b, $pin_r+$pitch*($max_folds+2), $pin_t);	# pin in0
	### METAL2 for NOR
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $pin_l+$nor_shift, $pin_b, $pin_r+$nor_shift, $pin_t);		# in0 metal
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $pin_l+$pitch+$nor_shift, $pin_b, $pin_r+$pitch+$nor_shift, $pin_t);		# in1 metal


######## CONTACTS
	my $cont_gnd_b = -2.145;
	my $cont_gnd_t = -1.925;
	my $cont_n_b = -1.175;
	my $cont_n_t = -.955;
	my $cont_p_b = 1.455;
	my $cont_p_t = 1.675;
	my $cont_vdd_b = 2.425;
	my $cont_vdd_t = 2.645;

	my $cont_pin_l = -.3;
	my $cont_pin_r = -.08;
	my $cont_pin_b = -.03;
	my $cont_pin_t = .19;

	print $lefhandle "    LAYER CONT ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $cont_pin_l+$pitch, $cont_pin_b, $cont_pin_r+$pitch, $cont_pin_t);		   # in0 contact
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $cont_pin_l+$pitch*($max_folds+2), $cont_pin_b, $cont_pin_r+$pitch*($max_folds+2), $cont_pin_t);  # in1 contact

	## for in0 and in1
	$i = 0;
	until ($i == ($max_folds + 2))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*(-$i)), $cont_vdd_b, .83+($pitch*(-$i)), $cont_vdd_t);	# vdd contacts left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*$i), $cont_vdd_b, .83+($pitch*$i), $cont_vdd_t);	# vdd contacts right
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*(-$i)), $cont_gnd_b, .83+($pitch*(-$i)), $cont_gnd_t);	# gnd contacts left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*$i), $cont_gnd_b, .83+($pitch*$i), $cont_gnd_t);	# gnd contacts right
		$i++;
	}

	$i = 0;
	until ($i >= ($nfolds + 2))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*(-$i)), $cont_n_b, .83+($pitch*(-$i)), $cont_n_t);	# nmos contacts left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*$i), $cont_n_b, .83+($pitch*$i), $cont_n_t);	# nmos contacts right
		$i++;
		if (($max_folds != 0) && ($i < ($nfolds + 2)))
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*(-$i)), $cont_n_b, .83+($pitch*(-$i)), $cont_n_t);	# nmos contacts left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*$i), $cont_n_b, .83+($pitch*$i), $cont_n_t);	# nmos contacts right
		}
		$i++;
	}

	$i = 0;
	until ($i >= ($pfolds + 2))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*(-$i)), $cont_p_b, .83+($pitch*(-$i)), $cont_p_t);	# pmos contacts left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*$i), $cont_p_b, .83+($pitch*$i), $cont_p_t);	# pmos contacts right
		$i++;
	}

	## for in2 and in3
	$i = $max_folds + 1+$adjust;
	until ($i == (2*$max_folds + 1+$adjust+2))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*$i), $cont_vdd_b, .83+($pitch*$i), $cont_vdd_t);	# vdd contacts right
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*$i), $cont_gnd_b, .83+($pitch*$i), $cont_gnd_t);	# gnd contacts right
		$i++;
	}

	$i = $max_folds + 1+$adjust;
	until ($i >= ($max_folds + 1+$adjust+$nfolds + 2))
	{
		if ($max_folds != 0)
		{
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*$i), $cont_n_b, .83+($pitch*$i), $cont_n_t);	# nmos contacts right
		}
		$i++;
		if ($i < ($max_folds + 1+$adjust+$nfolds + 2))
		{
		      printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*$i), $cont_n_b, .83+($pitch*$i), $cont_n_t);	# nmos contacts right
        }
        $i++;
	}

	$i = $max_folds + 1+$adjust;
	until ($i >= ($max_folds + 1+$adjust+$pfolds + 2))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*$i), $cont_p_b, .83+($pitch*$i), $cont_p_t);	# pmos contacts right
		$i++;
	}

	### CONTACTS for NOR
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .08+$nor_shift, $cont_pin_b, .30+$nor_shift, $cont_pin_t);		   # in0 contact
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .08+$pitch+$nor_shift, $cont_pin_b, .30+$pitch+$nor_shift, $cont_pin_t);  # in1 contact
	$i = 0;
	until ($i == ($max_foldsn + 2))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*(-$i))+$nor_shift, $cont_vdd_b, .83+($pitch*(-$i))+$nor_shift, $cont_vdd_t);	# vdd contacts left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*$i)+$nor_shift, $cont_vdd_b, .83+($pitch*$i)+$nor_shift, $cont_vdd_t);	# vdd contacts right
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*(-$i))+$nor_shift, $cont_gnd_b, .83+($pitch*(-$i))+$nor_shift, $cont_gnd_t);	# gnd contacts left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*$i)+$nor_shift, $cont_gnd_b, .83+($pitch*$i)+$nor_shift, $cont_gnd_t);	# gnd contacts right
		$i++;
	}

	$i = 0;
	until ($i >= ($pfoldsn + 2))
	{
		if (($i != 0) || ($pfoldsn != 0))
		{
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*(-$i))+$nor_shift, $cont_p_b, .83+($pitch*(-$i))+$nor_shift, $cont_p_t);	# pmos contacts left
			printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*$i)+$nor_shift, $cont_p_b, .83+($pitch*$i)+$nor_shift, $cont_p_t);	# pmos contacts right
		}
		$i++;
	}

	$i = 0;
	until ($i >= ($nfoldsn + 2))
	{
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*(-$i))+$nor_shift, $cont_n_b, .83+($pitch*(-$i))+$nor_shift, $cont_n_t);	# nmos contacts left
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, .61+($pitch*$i)+$nor_shift, $cont_n_b, .83+($pitch*$i)+$nor_shift, $cont_n_t);	# nmos contacts right
		$i++;
	}

######## VIA
	my $via_l = -.155;
	my $via_r = .105;
	my $via_b = -.035;
	my $via_t = .225;

	print $lefhandle "    LAYER VIA12 ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.135, $via_b, .125, $via_t);		# out via
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, $via_l+$pitch*($max_folds+2), $via_b, $via_r+$pitch*($max_folds+2), $via_t);		# in0 via

	#### VIA for NOR
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.105+$nor_shift, $via_b, .155+$nor_shift, $via_t);			# in0 via
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -.105+$pitch+$nor_shift, $via_b, .155+$pitch+$nor_shift, $via_t);	# in1 via

	printf $lefhandle "  END\nEND $cell_name\n";
}

1

