#!/usr/local/bin/perl -w


##### lef2cif.pl
##### parses LEF file and extracts pin and obs data to CIF format, creates verilog cell module definitions
##### NOTE: importing CIF into Cadence may require modification of layer map


$num_args = $#ARGV;
if ($num_args != 2)
{
	die "\n\t%USAGE: main.pl <input lef> <output cif> <output verilog>\n\n";
}
$inputfile = $ARGV[0];
$outputfile = $ARGV[1];
$libfile = $ARGV[2];

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
			print LIB "module $line(in0, out, vdd, gnd);\n";
			print LIB "input in0;\n";
			print LIB "output out;\n";
			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~(in0);\n";
		}
		elsif ($line =~ /nand2/i)
		{
			print LIB "module $line(in0, in1, out, vdd, gnd);\n";
			print LIB "input in0, in1;\n";
			print LIB "output out;\n";
			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~(in0 & in1);\n";
		}
		elsif ($line =~ /nor2/i)
		{
			print LIB "module $line(in0, in1, out, vdd, gnd);\n";
			print LIB "input in0, in1;\n";
			print LIB "output out;\n";
			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~(in0 | in1);\n";
		}
		elsif ($line =~ /nand3/i)
		{
			print LIB "module $line(in0, in1, in2, out, vdd, gnd);\n";
			print LIB "input in0, in1, in2;\n";
			print LIB "output out;\n";
			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~(in0 & in1 & in2);\n";
		}
		elsif ($line =~ /nor3/i)
		{
			print LIB "module $line(in0, in1, in2, out, vdd, gnd);\n";
			print LIB "input in0, in1, in2;\n";
			print LIB "output out;\n";
			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~(in0 | in1 | in2);\n";
		}
		elsif ($line =~ /aoi21/i)
		{
			print LIB "module $line(in0, in1, in2, out, vdd, gnd);\n";
			print LIB "input in0, in1, in2;\n";
			print LIB "output out;\n";
			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~((in0 & in1) | in2);\n";
		}
		elsif ($line =~ /oai21/i)
		{
			print LIB "module $line(in0, in1, in2, out, vdd, gnd);\n";
			print LIB "input in0, in1, in2;\n";
			print LIB "output out;\n";
			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~((in0 | in1) & in2);\n";
		}
		elsif ($line =~ /nand4/i)
		{
			print LIB "module $line(in0, in1, in2, in3, out, vdd, gnd);\n";
			print LIB "input in0, in1, in2, in3;\n";
			print LIB "output out;\n";
			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~(in0 & in1 & in2 & in3);\n";
		}
		elsif ($line =~ /nor4/i)
		{
			print LIB "module $line(in0, in1, in2, in3, out, vdd, gnd);\n";
			print LIB "input in0, in1, in2, in3;\n";
			print LIB "output out;\n";
			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~(in0 | in1 | in2 | in3);\n";
		}
		elsif ($line =~ /aoi22/i)
		{
			print LIB "module $line(in0, in1, in2, in3, out, vdd, gnd);\n";
			print LIB "input in0, in1, in2, in3;\n";
			print LIB "output out;\n";
			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~((in0 & in1) | (in2 & in3));\n";
		}
		elsif ($line =~ /oai22/i)
		{
			print LIB "module $line(in0, in1, in2, in3, out, vdd, gnd);\n";
			print LIB "input in0, in1, in2, in3;\n";
			print LIB "output out;\n";
			print LIB "inout vdd, gnd;\n";
			print LIB "assign out = ~((in0 | in1) & (in2 | in3));\n";
		}
		elsif ($line =~ /xor2/i)
		{
			print LIB "module $line(in0, in1, out, vdd, gnd);\n";
			print LIB "input in0, in1;\n";
			print LIB "output out;\n";
			print LIB "inout vdd, gnd;\n";
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
			print CIF "\nL $line;\n";
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


