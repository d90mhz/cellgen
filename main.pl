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

use POSIX;



##### variables
$lambda = 1;		# lambda in microns
$height = 102;		# common cell height in lambda, minimum 102
$ratio = 1;		# ratio of area above pins to area below (n = n:1)

$height = 16 + (16 * (int ($height / 16)));
$height += 6;

##### filehandling
$num_args = $#ARGV;
if ($num_args != 2)
{
	die "\n\t%USAGE: main.pl <input hspice netlist> <output lef> <lef header>\n\n";
}
$inputnetlist = $ARGV[0];
$outputlef = $ARGV[1];
$lefheader = $ARGV[2];
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