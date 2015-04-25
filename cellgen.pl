#!/usr/local/bin/perl -w


##### external subroutines
require 'sub.pl';
require 'inv.pl';
require 'nand2.pl';
require 'nand3.pl';
require 'nand4.pl';
require 'nor2.pl';
require 'nor3.pl';
require 'nor4.pl';
require 'aoi21.pl';
require 'aoi22.pl';
require 'oai21.pl';
require 'oai22.pl';
require 'xor2.pl';
require 'filler.pl';
#require 'header.lef';

use POSIX;



##### variables
$lambda = 1;		# lambda in microns
$height = 5.04;		# common cell height in lambda, minimum 102
$ratio = 1;		# ratio of area above pins to area below (n = n:1)


##### filehandling
$num_args = $#ARGV;
if ($num_args != 1)
{
	die "\n\t%USAGE: cellgen.pl <input_hspice_netlist.sp> <lef_header.lef>\n\n";
}
$inputnetlist = $ARGV[0];
$name = $ARGV[0];
$i = 'a';
until (ord($i) == ord('.'))
{
	$i = chop $name;
}
$outputlef = join('.', $name, "lef");
$lefheader = $ARGV[1];
open (SPI, "$inputnetlist") || die;
open (LEF, ">$outputlef") || die;


##### main
head (*LEF, $lefheader);
core (*LEF, $lambda, $height);
scan (*SPI, *LEF, "inv", $lambda, $height, $ratio);
scan (*SPI, *LEF, "nand2", $lambda, $height, $ratio);
scan (*SPI, *LEF, "nand3", $lambda, $height, $ratio);
scan (*SPI, *LEF, "nand4", $lambda, $height, $ratio);
scan (*SPI, *LEF, "nor2", $lambda, $height, $ratio);
scan (*SPI, *LEF, "nor3", $lambda, $height, $ratio);
scan (*SPI, *LEF, "nor4", $lambda, $height, $ratio);
scan (*SPI, *LEF, "aoi21", $lambda, $height, $ratio);
scan (*SPI, *LEF, "aoi22", $lambda, $height, $ratio);
scan (*SPI, *LEF, "oai21", $lambda, $height, $ratio);
scan (*SPI, *LEF, "oai22", $lambda, $height, $ratio);
scan (*SPI, *LEF, "xor2", $lambda, $height, $ratio);
filler (*LEF, $lambda, $height);
print LEF "END LIBRARY\n";


##### filehandling
close (SPI);
close (LEF);


##### lef2cif.pl
##### parses LEF file and extracts pin and obs data to CIF format, creates verilog cell module definitions
##### NOTE: importing CIF into Cadence may require modification of layer map


$inputfile = $outputlef;
$outputfile = join('.', $name, "cif");
$libfile = join('.', $name, "v");


open(LEF,"$inputfile") || die;
open(CIF,">$outputfile") || die;
open(LIB,">$libfile") || die;

$i = 0;
$line = "a";
$chars = 0;

until (($line =~ /macro/i) || (eof LEF))
{
	$line = <LEF>;
}
until (eof LEF)
{
	chomp $line;
	if ($line =~ /macro/i)
	{
		$i++;
		$chars = 0;
		if ($i > 1)
		{
			print CIF "\nDF;\n";
		}
		$line =~ s/macro| |;//ig;
		print CIF "DS $i 1 1;\n";
		print CIF "9 $line;\n";
		if ($line =~ /inv/i)
		{
			print LIB "module $line(in0, out);\n";
			print LIB "input in0;\n";
			print LIB "output out;\n";
#			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~(in0);\n";
		}
		elsif ($line =~ /nand2/i)
		{
			print LIB "module $line(in0, in1, out);\n";
			print LIB "input in0, in1;\n";
			print LIB "output out;\n";
#			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~(in0 & in1);\n";
		}
		elsif ($line =~ /nor2/i)
		{
			print LIB "module $line(in0, in1, out);\n";
			print LIB "input in0, in1;\n";
			print LIB "output out;\n";
#			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~(in0 | in1);\n";
		}
		elsif ($line =~ /nand3/i)
		{
			print LIB "module $line(in0, in1, in2, out);\n";
			print LIB "input in0, in1, in2;\n";
			print LIB "output out;\n";
#			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~(in0 & in1 & in2);\n";
		}
		elsif ($line =~ /nor3/i)
		{
			print LIB "module $line(in0, in1, in2, out);\n";
			print LIB "input in0, in1, in2;\n";
			print LIB "output out;\n";
#			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~(in0 | in1 | in2);\n";
		}
		elsif ($line =~ /aoi21/i)
		{
			print LIB "module $line(in0, in1, in2, out);\n";
			print LIB "input in0, in1, in2;\n";
			print LIB "output out;\n";
#			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~((in0 & in1) | in2);\n";
		}
		elsif ($line =~ /oai21/i)
		{
			print LIB "module $line(in0, in1, in2, out);\n";
			print LIB "input in0, in1, in2;\n";
			print LIB "output out;\n";
#			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~((in0 | in1) & in2);\n";
		}
		elsif ($line =~ /nand4/i)
		{
			print LIB "module $line(in0, in1, in2, in3, out);\n";
			print LIB "input in0, in1, in2, in3;\n";
			print LIB "output out;\n";
#			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~(in0 & in1 & in2 & in3);\n";
		}
		elsif ($line =~ /nor4/i)
		{
			print LIB "module $line(in0, in1, in2, in3, out);\n";
			print LIB "input in0, in1, in2, in3;\n";
			print LIB "output out;\n";
#			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~(in0 | in1 | in2 | in3);\n";
		}
		elsif ($line =~ /aoi22/i)
		{
			print LIB "module $line(in0, in1, in2, in3, out);\n";
			print LIB "input in0, in1, in2, in3;\n";
			print LIB "output out;\n";
#			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~((in0 & in1) | (in2 & in3));\n";
		}
		elsif ($line =~ /oai22/i)
		{
			print LIB "module $line(in0, in1, in2, in3, out);\n";
			print LIB "input in0, in1, in2, in3;\n";
			print LIB "output out;\n";
#			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~((in0 | in1) & (in2 | in3));\n";
		}
		elsif ($line =~ /xor2/i)
		{
			print LIB "module $line(in0, in1, out);\n";
			print LIB "input in0, in1;\n";
			print LIB "output out;\n";
#			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~((in0 & in1) | (~(in0 | in1)));\n";
		}
		if (!($line =~ /filler/i))
		{
			print LIB "endmodule\n\n";
		}
	}
	if ($line =~ /layer/i)
	{
		$line =~ s/layer| |;//ig;
		if ($line =~ /METAL2/i)
		{
			print CIF "\nL $line;\n";
		}
		else
		{
			print CIF "\nL $line\r;\n";
		}
		$chars += 8;
	}
	if ($line =~ /rect /i)
	{
		$line =~ s/\s*rect\s*|\s*;//ig;
		@lefcoords = split (/ /i, $line);

		printf CIF "P %d,%d %d,%d %d,%d %d,%d;", 10000*($lefcoords[0]), 10000*($lefcoords[1]), 10000*($lefcoords[2]), 10000*($lefcoords[1]), 10000*($lefcoords[2]), 10000*($lefcoords[3]), 10000*($lefcoords[0]), 10000*($lefcoords[3]);
		$chars += 18;
	}
	if ($chars >= 100)
	{
		$chars = 0;
		print CIF "\n";
	}
	$line = <LEF>;
}
	if ($i > 0)
	{
		print CIF "\nDF;\nE\n";
	}
$i = 0;
$line = "a";
$chars = 0;

until (($line =~ /macro/i) || (eof LEF))
{
	$line = <LEF>;
}
until (eof LEF)
{
	chomp $line;
	if ($line =~ /macro/i)
	{
		$i++;
		$chars = 0;
		if ($i > 1)
		{
			print CIF "\nDF;\n";
		}
		$line =~ s/macro| |;//ig;
		print CIF "DS $i 1 1;\n";
		print CIF "9 $line;\n";
		if ($line =~ /inv/i)
		{
			print LIB "module $line(in0, out, vdd, gnd);\n";
			print LIB "input in0;\n";
			print LIB "output out;\n";
			print LIB "inout vdd gnd;\n";
			print LIB "assign out = ~(in0);\n";
		}
		elsif ($line =~ /nand2/i)
		{
			print LIB "module $line(in0, in1, out, vdd, gnd);\n";
			print LIB "input in0, in1;\n";
			print LIB "output out;\n";
			print LIB "inout vdd gnd;\n";
			print LIB "assign out = ~(in0 & in1);\n";
		}
		elsif ($line =~ /nor2/i)
		{
			print LIB "module $line(in0, in1, out, vdd, gnd);\n";
			print LIB "input in0, in1;\n";
			print LIB "output out;\n";
			print LIB "inout vdd gnd;\n";
			print LIB "assign out = ~(in0 | in1);\n";
		}
		elsif ($line =~ /nand3/i)
		{
			print LIB "module $line(in0, in1, in2, out, vdd, gnd);\n";
			print LIB "input in0, in1, in2;\n";
			print LIB "output out;\n";
			print LIB "inout vdd gnd;\n";
			print LIB "assign out = ~(in0 & in1 & in2);\n";
		}
		elsif ($line =~ /nor3/i)
		{
			print LIB "module $line(in0, in1, in2, out, vdd, gnd);\n";
			print LIB "input in0, in1, in2;\n";
			print LIB "output out;\n";
			print LIB "inout vdd gnd;\n";
			print LIB "assign out = ~(in0 | in1 | in2);\n";
		}
		elsif ($line =~ /aoi21/i)
		{
			print LIB "module $line(in0, in1, in2, out, vdd, gnd);\n";
			print LIB "input in0, in1, in2;\n";
			print LIB "output out;\n";
			print LIB "inout vdd gnd;\n";
			print LIB "assign out = ~((in0 & in1) | in2);\n";
		}
		elsif ($line =~ /oai21/i)
		{
			print LIB "module $line(in0, in1, in2, out, vdd, gnd);\n";
			print LIB "input in0, in1, in2;\n";
			print LIB "output out;\n";
			print LIB "inout vdd gnd;\n";
			print LIB "assign out = ~((in0 | in1) & in2);\n";
		}
		elsif ($line =~ /nand4/i)
		{
			print LIB "module $line(in0, in1, in2, in3, out, vdd, gnd);\n";
			print LIB "input in0, in1, in2, in3;\n";
			print LIB "output out;\n";
			print LIB "inout vdd gnd;\n";
			print LIB "assign out = ~(in0 & in1 & in2 & in3);\n";
		}
		elsif ($line =~ /nor4/i)
		{
			print LIB "module $line(in0, in1, in2, in3, out, vdd, gnd);\n";
			print LIB "input in0, in1, in2, in3;\n";
			print LIB "output out;\n";
			print LIB "inout vdd gnd;\n";
			print LIB "assign out = ~(in0 | in1 | in2 | in3);\n";
		}
		elsif ($line =~ /aoi22/i)
		{
			print LIB "module $line(in0, in1, in2, in3, out, vdd, gnd);\n";
			print LIB "input in0, in1, in2, in3;\n";
			print LIB "output out;\n";
			print LIB "inout vdd gnd;\n";
			print LIB "assign out = ~((in0 & in1) | (in2 & in3));\n";
		}
		elsif ($line =~ /oai22/i)
		{
			print LIB "module $line(in0, in1, in2, in3, out, vdd, gnd);\n";
			print LIB "input in0, in1, in2, in3;\n";
			print LIB "output out;\n";
			print LIB "inout vdd gnd;\n";
			print LIB "assign out = ~((in0 | in1) & (in2 | in3));\n";
		}
		elsif ($line =~ /xor2/i)
		{
			print LIB "module $line(in0, in1, out, vdd, gnd);\n";
			print LIB "input in0, in1;\n";
			print LIB "output out;\n";
			print LIB "inout vdd gnd;\n";
			print LIB "assign out = ~((in0 & in1) | (~(in0 | in1)));\n";
		}
		if (!($line =~ /filler/i))
		{
			print LIB "endmodule\n\n";
		}
	}
	if ($line =~ /layer/i)
	{
		$line =~ s/layer| |;//ig;
		if ($line =~ /METAL2/i)
		{
			print CIF "\nL $line;\n";
		}
		else
		{
			print CIF "\nL $line^M;\n";
		}
		$chars += 8;
	}
	if ($line =~ /rect /i)
	{
		$line =~ s/\s*rect\s*|\s*;//ig;
		@lefcoords = split (/ /i, $line);

		printf CIF "P %d,%d %d,%d %d,%d %d,%d;", 10000*($lefcoords[0]), 10000*($lefcoords[1]), 10000*($lefcoords[2]), 10000*($lefcoords[1]), 10000*($lefcoords[2]), 10000*($lefcoords[3]), 10000*($lefcoords[0]), 10000*($lefcoords[3]);
		$chars += 18;
	}
	if ($chars >= 100)
	{
		$chars = 0;
		print CIF "\n";
	}
	$line = <LEF>;
}
	if ($i > 0)
	{
		print CIF "\nDF;\nE\n";
	}

##### filehandling
close (LEF);
close (CIF);
close (LIB);
