#!/usr/bin/perl
#!/usr/bin/perl -w
use strict;
use Test::Simple tests => 2;

sub binary_search {
  my ($array, $key, $lo, $hi) = @_;
  my $mid;

  while($lo <= $hi) {
    $mid = int ($lo + ($hi - $lo)/2);
    if ($key < @$array[$mid]){
      $hi = $mid - 1;
    } elsif ($key > @$array[$mid]) {
      $lo = $mid + 1;
    } else {
      return 1;
    }
  }
  return 0;
}

sub three_sum_binary_search {
  my (@array) = @_;
  my $count = 0;
  my $n = @array;
  my $val;
  my $k;

  for(my $i= 0; $i < $n; $i++ ){
    for(my $j= $i + 1; $j < $n - 1; $j++ ){
      $val = ($array[$i] + $array[$j]) * -1;
      $k = $j + 1;
      if (binary_search(\@array, $val, $k, $n)){
        $count += 1;
      }
    }
  }
  return $count;
}


my @arr1 = (-3, -2, -1, 0, 1, 2, 3);
my @arr2 = (3, 2, 1, 0, 1, 2, 3);

ok(three_sum_binary_search(@arr1) eq 5, 'Test on array (-3, -2, -1, 0, 1, 2, 3)');
ok(three_sum_binary_search(@arr2) eq 0, 'Test on array (3, 2, 1, 0, 1, 2, 3)');
