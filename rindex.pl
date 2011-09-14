#! /usr/bin/perl -W

#use strict;
use warnings;

$file = "/media/320/Users/Ben/School/Concordia University/Classes/COMP 479 (Information Retrieval)/Class notes Sept 7 2011.txt";

open("IN", "<".$file) or die ("File " .$file." - Not Found.\n");
# $line_counter = 0;
%index = (); # make a hash the dictionary that will store an array or documents
@tokens = (); # Store the tokens in an array for processing

while ($line = readline(IN))
{ 
  # remove the new line character
  chomp($line);
  # split the contents of each line on spaces into tokens
  # side effect here is compound words stay attached
  @tokens = split(/\s/, $line);

  foreach(@tokens)
  {
     # Remove , : ; ! ? \ / ( ) < > [ ] { } _ * = 
    $_ =~ s/,*:*;*#*~*`*\$*%*\**\(*\)*=*{*}*\[*\]*<*>*_*\\*\/*\|*//g;

    if ($_ =~ m/^-+$/) 
    {
      # if the current token is a dash, do nothing
    }
    elsif ($_ =~ m/\d+/)
    {
      # if the current token is a number, do nothing
    }
    else
    {
      # the word is valid, store it in the index in lower case
      @postings = ();
      push(@postings, $file);
      push @{ $index{lc($_)} }, \@postings;
    }
  } 
}

close IN;

while(($key, $value) = each(%index))
{
  print "$key\n";
}

#@tokens = grep { /[A-Z][a-z]/, $_ } @tokens;
