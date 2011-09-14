#! /usr/bin/perl -W

#use strict;
use warnings;

$file = "/media/320/Users/Ben/School/Concordia University/Classes/COMP 479 (Information Retrieval)/Class notes Sept 7 2011.txt";

open("IN", "<".$file) or die ("File " .$file." - Not Found.\n");

$line_counter = 0;

while ($line = readline(IN))
{
  print $line."\n";
}
close IN;
