sub bubble-sort(@array) {
    my $n = @array.elems;
    for 1..^$n -> $i {
        for 0..^($n-$i) -> $j {
            if (@array[$j] cmp @array[$j+1]) > 0 {
                (@array[$j], @array[$j+1]) = (@array[$j+1], @array[$j]);
            }
        }
    }
    return @array;
}

my @array = <banana apple orange pear>;
say bubble-sort(@array); # OUTPUT: «(apple banana orange pear)␤»

