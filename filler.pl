#!/usr/loCONTl/bin/perl -w


sub filler	# parameters: lef filehandle, lambda, height
{
	my $lefhandle = shift @_;
	my $lambda = shift @_;
	my $height = shift @_;

	my $min_height = 5.04;

	my @lcoords = (0, 0, 0, 0);
	my $min_ph =  $min_height / 2;
	my $min_nh = $min_height - $min_ph;
	my $delta_ph = ($height / 2) - $min_ph;
	my $delta_nh = $height - $min_height - $delta_ph;

	print $lefhandle "MACRO filler\n  CLASS CORE ;\n";
	@lcoords = lefcoords ($lambda, -20, -22, -4, 22);							# cell boundary
	printf $lefhandle "  FOREIGN filler %.3f %.3f ;\n", $lcoords[0], $lcoords[1];
	printf $lefhandle "  ORIGIN %.3f %.3f ;\n", - $lcoords[0], - $lcoords[1];
	printf $lefhandle "  SIZE %.3f BY %.3f ;\n", $lcoords[2] - $lcoords[0], $lcoords[3] - $lcoords[1];
	print $lefhandle "  SYMMETRY X Y ;\n  SITE CoreSite ;\n";
	print $lefhandle "  PIN vdd!\n    DIRECTION INOUT ;\n    USE POWER ;\n    SHAPE ABUTMENT ;\n";
	print $lefhandle "    PORT\n    LAYER METAL1 ;\n";
	@lcoords = lefcoords ($lambda, -20, 20, -4, 24);								# pin vdd!
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END vdd!\n  PIN gnd!\n    DIRECTION INOUT ;\n    USE GROUND ;\n    SHAPE ABUTMENT ;\n ";
	print $lefhandle "   PORT\n    LAYER METAL1 ;\n";
	@lcoords = lefcoords ($lambda, -20, -24, -4, -20);								# pin gnd!
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", $lcoords[0], $lcoords[1], $lcoords[2], $lcoords[3];
	print $lefhandle "    END\n  END gnd!\n";

	## METAL2 SHIELD STRIPES AS PINS
	$i = 0;
	$j = 0;
	until ($i >= 32)
	{
		print $lefhandle "  PIN shield_$j\n    DIRECTION INOUT ;\n    PORT\n    LAYER METAL2 ;\n";
		printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -6-($i), -24, -2-($i), 24);			# shield stripes
		print $lefhandle "    END\n  END shield_$j\n";
		$j++;
		$i+=16;
	}

	print $lefhandle "  OBS\n";
	## NWELL
	print $lefhandle "    LAYER NWELL ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -24, 0, 0, 28+$delta_ph);				# NWELL
	## NSELECT
	print $lefhandle "    LAYER NIMP ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -20, 18+$delta_ph, -4, 26+$delta_ph);			# vdd! select
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -20, -18-$delta_nh, -4, 0);				# nmos select
	## PSELECT
	print $lefhandle "    LAYER PIMP ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -20, -26-$delta_nh, -4, -18-$delta_nh);		# gnd! select
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -20, 0, -4, 18+$delta_ph);				# pmos select
	## NACTIVE
	print $lefhandle "    LAYER DIFF ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -18, 20+$delta_ph, -6, 24+$delta_ph);			# vdd! active
	## PACTIVE
	print $lefhandle "    LAYER DIFF ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -18, -24-$delta_nh, -6, -20-$delta_nh);		# gnd! active
	## CA
	print $lefhandle "    LAYER CONT ;\n";
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -9, 21+$delta_ph, -7, 23+$delta_ph);			# vdd strapping
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -9, -23-$delta_nh, -7, -21-$delta_nh);		# gnd strapping
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -17, 21+$delta_ph, -15, 23+$delta_ph);		# vdd strapping
	printf $lefhandle "    RECT %.3f %.3f %.3f %.3f ;\n", lefcoords ($lambda, -17, -23-$delta_nh, -15, -21-$delta_nh);		# gnd strapping

	printf $lefhandle "  END\nEND filler\n";
}

1
