#!/usr/bin/perl
use strict;
use Test::Simple tests => 2;

sub three_sum{
  my (@array) = @_;
  my $count = 0;
  my $n = @array;
  for(my $i= 0; $i < $n; $i++ ){
    for(my $j= $i + 1; $j < $n; $j++ ){
      for(my $k= $j + 1; $k < $n; $k++ ){
        if ($array[$i] + $array[$j] + $array[$k] == 0){
          $count += 1;
        }
      }
    }
  }
  return $count;
}

my @arr1 = (-3, -2, -1, 0, 1, 2, 3);
my @arr2 = (3, 2, 1, 0, 1, 2, 3);

ok(three_sum(@arr1) eq 5, 'Test on array (-3, -2, -1, 0, 1, 2, 3)');
ok(three_sum(@arr2) eq 0, 'Test on array (3, 2, 1, 0, 1, 2, 3)');
