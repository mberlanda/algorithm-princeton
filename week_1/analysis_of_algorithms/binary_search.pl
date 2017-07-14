#!/usr/bin/perl -w
use strict;
use Test::Simple tests => 3;

sub binary_search {
  my ($array, $n) = @_;
  my $lo = 0;
  my $hi = $#$array;
  my $mid;

  while($lo <= $hi) {
    $mid = int ($lo + ($hi - $lo)/2);
    if ($n < @$array[$mid]){
      $hi = $mid - 1;
    } elsif ($n > @$array[$mid]) {
      $lo = $mid + 1;
    } else {
      return $mid;
    }
  }
  return "not found";
}

my @list = (1, 5, 7, 11, 12, 18, 19, 20, 33, 42, 77, 93, 101);
ok( binary_search(\@list, 12) eq 4 );
ok( binary_search(\@list, 101) eq 12 );
ok( binary_search(\@list, 121) eq "not found" );
