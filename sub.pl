#!/usr/local/bin/perl -w

##### calculates actual cell dimensions
sub calc	# parameters: lambda, height, ratio, pins, min cell height, psize, nsize, max psize @ min height, max nsize @ min height
{
	my $lambda = shift @_;
	my $height = shift @_;
	my $ratio = shift @_;
	my $pins = shift @_;
	my $min_height = shift @_;
	my $psize = shift @_;
	my $nsize = shift @_;
	my $max_psize_min = shift @_;				# max size of pmos transistors per fold at min height
	my $max_nsize_min = shift @_;				# max size of nmos transistors per fold at min height
	my $min_psize = .42;					# min size of pmos transistors per fold
	my $min_nsize = .42;					# min size of nmos transistors per fold
	my $min_width = $pins * 1.44;				# minimum width of cell
	my $min_ph = $min_height / 2;				# min height of upper section of cell (pin centerline to upper boundary edge)
	my $min_nh = $min_height / 2;				# min height of lower section of cell (pin centerline to lower boundary edge)
	my $ph = 2.77;						# height of upper section of cell
	my $nh = 2.27;						# height of lower section of cell
	my $delta_ph = 0;
	my $delta_nh = 0;
	if ($psize < .42)
	{
		$psize = .42;
	}
	if ($nsize < .42)
	{
		$nsize = .42;
	}
############### $ph and $nh are fixed #################################
#	if (($ph >= $min_ph) && ($nh >= $min_nh))		# if ph, nh are above min
#	{
#		$delta_ph = floor($ph - $min_ph);		# set change in ph from min
#		$delta_nh = floor($nh - $min_nh);		# set change in nh from min
#	}
#	elsif (($ph >= $min_ph) && ($nh < $min_nh))		# if nh is below min
#	{
#		$nh = floor($min_nh);				# set nh to minimum
#		$ph = floor($height - $min_nh);			# set ph as large as possible
#		$delta_ph = floor($ph - $min_ph);
#		$delta_nh = 0;
#	}
#	elsif (($ph < $min_ph) && ($nh >= $min_nh))		# if ph is below min
#	{
#		$ph = floor($min_ph);				# set ph to minimum
#		$nh = floor($height - $min_ph);			# set nh as large as possible
#		$delta_ph = 0;
#		$delta_nh = floor($nh - $min_nh);
#	}
########################################################################
	my $max_psize = 1.445;					# maximum pmos transistor size per fold
	my $max_nsize = .945;					# maximum nmos transistor size per fold
	my $pfolds = floor(($psize / $max_psize) - .001);		# number of pmos folds
	my $nfolds = floor(($nsize / $max_nsize) - .001);		# number of nmos folds
	my $max_folds = 1;					# max number of folds
	if ($pfolds >= $nfolds)					# set max number of folds
	{
		$max_folds = $pfolds;
	}
	else
	{
		$max_folds = $nfolds;
	}
################# I think I want max_folds to be 0 if it is 0
#	if ($max_folds < 1)					# min number of folds is 1
#	{
#		$max_folds = 1;
#	}
	my $psize_each = (floor(200*($psize / ($pfolds + 1))))/200;		# pmos transistor size per fold
	my $nsize_each = (floor(200*($nsize / ($nfolds + 1))))/200;		# nmos transistor size per fold
	my $psize_act = $psize_each * ($pfolds + 1);		# actual folded pmos transistor size
	my $nsize_act = $nsize_each * ($nfolds + 1);		# actual folded nmos transistor size
	my $delta_width = ($max_folds) * ($pins - 1) * .72;	# change in cell width from min
	if (($delta_width % 1.44) != 0)				# round up to nearest 2x pin pitches
	{
		$delta_width += .72;
	}
	my $width = $min_width + $delta_width;			# cell width

	##### print variables
#	print "ph              $ph\n";
#	print "nh              $nh\n";
#	print "delta ph        $delta_ph\n";
#	print "delta nh        $delta_nh\n";
#	print "max psize       $max_psize\n";
#	print "max nsize       $max_nsize\n";
#	print "pfolds          $pfolds\n";
#	print "nfolds          $nfolds\n";
#	print "max folds       $max_folds\n";
#	print "psize ea        $psize_each\n";
#	print "nsize ea        $nsize_each\n";
#	print "psize original  $psize\n";
#	print "nsize original  $nsize\n";
#	print "psize act       $psize_act\n";
#	print "nsize act       $nsize_act\n";
#	print "delta w         $delta_width\n";
#	print "width           $width\n";

	return ($delta_ph, $delta_nh, $pfolds, $nfolds, $max_folds, $psize_each, $nsize_each, $delta_width, $width);
}

#### extracts width from hspice mosfet definition
sub extract	# parameters: string_coordinates, lambda
{
	my $string = shift @_;
	my $lambda = shift @_;
	chomp $string;
	$string = join "", $string, " ";
	my $pos1 = 2 + index $string, "w=";
	my $pos2 = index $string, " ", $pos1;
	my $width = substr $string, $pos1, $pos2 - $pos1;
	my ($mantissa, $exponent) = split /e/i, $width, 2;
	$width = ($mantissa * 10 ** ($exponent + 6)) / $lambda;
	return $width;
}

##### scans hspice netlist for cell net definition, extracts mos widths, and creates cell in lef format
sub scan	# parameters: hspice filehandle, lef filehandle, cell_type, lambda, height, ratio
{
	my $spihandle = shift @_;
	my $lefhandle = shift @_;
	my $cell_type = shift @_;
	my $lambda = shift @_;
	my $height = shift @_;
	my $ratio = shift @_;
	my $in = "";
	my $nsize = 0;
	my $psize = 0;
	my $nsizen = 0;		# width of nor nmos in xor2 gate
	my $psizen = 0;		# width of nor pmos in xor2 gate
	seek $spihandle, 0, 0;
	until (eof $spihandle)
	{
		until (($in =~ /subckt $cell_type/i) || (eof $spihandle))
		{
			$in = <$spihandle>;
		}
		if ($in =~ /subckt $cell_type/i)
		{
			chomp $in;
			my $pos1 = index $in, $cell_type;
			my $pos2 = index $in, " ", $pos1;
			$cell_name = substr $in, $pos1, $pos2 - $pos1;
			print "$cell_name\n";

			until (($in =~ /nmos/i) || ($in =~ /pmos/i) || ($in =~ /ends/i))
			{
				$in = <$spihandle>;
			}

			if ($cell_type =~ /xor2/i)
			{
				$nsizen = 0;
				$psizen = 0;
				$nsize = 0;
				$psize = 0;
				until ($in =~ /ends/i)
				{
					#if nmos with source or drain as output of first-stage nor2
					if (($in =~ /.+?\s+inta\s+.+?\s+.+?\s+.+?\s+nmos/i)||($in =~ /.+?\s+.+?\s+.+?\s+inta\s+.+?\s+nmos/i))
					{
						if ($nsizen == 0)
						{
							$nsizen = extract ($in, $lambda);
						}
					}
					#if nmos with source or drain as output of second-stage aoi21
					elsif (($in =~ /.+?\s+out\s+.+?\s+.+?\s+.+?\s+nmos/i)||($in =~ /.+?\s+.+?\s+.+?\s+out\s+.+?\s+nmos/i))
					{
						if ($nsize == 0)
						{
							$nsize = extract ($in, $lambda);
						}
					}
					#if pmos with source or drain as output of first-stage nor2
					elsif (($in =~ /.+?\s+inta\s+.+?\s+.+?\s+.+?\s+pmos/i)||($in =~ /.+?\s+.+?\s+.+?\s+inta\s+.+?\s+pmos/i))
					{
						if ($psizen == 0)
						{
							$psizen = extract ($in, $lambda);
						}
					}
					#if pmos with source or drain as output of second-stage aoi21
					elsif (($in =~ /.+?\s+out\s+.+?\s+.+?\s+.+?\s+pmos/i)||($in =~ /.+?\s+.+?\s+.+?\s+out\s+.+?\s+pmos/i))
					{
						if ($psize == 0)
						{
							$psize = extract ($in, $lambda);
						}
					}
					$in = <$spihandle>;
				}
				&$cell_type($lefhandle, $cell_name, $lambda, $height, $ratio, $psize, $nsize, $psizen, $nsizen);
			}
			else
			{
				if ($in =~ /nmos/i)
				{
					$nsize = extract ($in, $lambda);
					until (($in =~ /pmos/i) || ($in =~ /ends/i))
					{
						$in = <$spihandle>;
					}
					$psize = extract ($in, $lambda);
				}
				elsif ($in =~ /pmos/i)
				{
					$psize = extract ($in, $lambda);
					until (($in =~ /pmos/i) || ($in =~ /ends/i))
					{
						$in = <$spihandle>;
					}
					$nsize = extract ($in, $lambda);
				}
				&$cell_type($lefhandle, $cell_name, $lambda, $height, $ratio, $psize, $nsize);
			}
		}
	}
}

##### converts coordinates from lambda scale to microns, lower-left and upper-right vertices
sub lefcoords		# parameters: lambda, x1, y1, x2, y2
{
	my $lambda = shift @_;
	my @coords = @_;
	foreach $coord (@coords)
	{
		$coord = $coord * $lambda;
	}
	return @coords;
}

##### returns a 1 if the input is even and a 0 if it is not
sub iseven		# parameters: x
{
	my $x = shift @_;

	if (($x - 2*floor(($x/2)+0.01)) == 0)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

##### returns a 1 if the input is odd and a 0 if it is not
sub isodd		# parameters: x
{
	my $x = shift @_;

	if (($x - 2*floor(($x/2)+0.01)) == 1)

	{
		return 1;
	}
	else
	{
		return 0;
	}
}

####converts coordinates from lambda scale to microns, width, height, x-center, y-center
sub cifcoords		# parameters: lambda, x1, y1, x2, y2
{
	my $lambda = shift @_;
	my @coords = @_;
	my @newcoords = (0, 0, 0, 0);
	$newcoords[0] = $coords[2]-$coords[0];
	$newcoords[1] = $coords[3]-$coords[1];
	$newcoords[2] = $coords[0]+($newcoords[0]/2);
	$newcoords[3] = $coords[1]+($newcoords[1]/2);
	return @newcoords;
}

sub head		# parameters: lef filehandle, header filename
{
	my $lefhandle = shift @_;
	my $header = shift @_;
	open (HEAD, $header) || die;

	while (<HEAD>)
	{
		print $lefhandle $_;
	}
}

sub core		# parameters: lef filehandle, lambda, height
{
	my $lefhandle = shift @_;
	my $corelambda = shift @_;
	my $coreheight = shift @_;

#	print $lefhandle "\nSITE  CoreSite\n";
#	print $lefhandle "    CLASS       CORE ;\n";
#	print $lefhandle "    SYMMETRY    Y ;\n";
#	printf $lefhandle "    SIZE        %.3f BY %.3f ;\n", 8*$corelambda, $lambda*$coreheight;
#	print $lefhandle "END  CoreSite\n\n";
	
	print $lefhandle "SITE  TDCoverSite\n";
	print $lefhandle "    CLASS       CORE ;\n";
	print $lefhandle "    SIZE        1.000 BY 1.000 ;\n";
	print $lefhandle "END  TDCoverSite\n\n";
	
	print $lefhandle "SITE  SBlockSite\n";
	print $lefhandle "    CLASS       CORE ;\n";
	print $lefhandle "    SIZE        1.000 BY 1.000 ;\n";
	print $lefhandle "END  SBlockSite\n\n";
	
	print $lefhandle "SITE  PortCellSite\n";
	print $lefhandle "    CLASS       PAD ;\n";
	print $lefhandle "    SIZE        1.000 BY 1.000 ;\n";
	print $lefhandle "END  PortCellSite\n\n";
	
	print $lefhandle "SITE  Core\n";
	print $lefhandle "    CLASS       CORE ;\n";
	print $lefhandle "    SYMMETRY    Y ;\n";
	printf $lefhandle "    SIZE        %.3f BY %.3f ;\n", 8*$corelambda, $lambda*$coreheight;
	print $lefhandle "END  Core\n\n";
}
1
