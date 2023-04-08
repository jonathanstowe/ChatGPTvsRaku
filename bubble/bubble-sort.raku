sub bubble-sort(@array) {
    my $n = @array.elems;
    for ^$n -> $i {
        for ^($n - $i - 1) -> $j {
            if @array[$j] cmp @array[$j + 1] == Order::More {
                @array[$j, $j + 1] = @array[$j + 1, $j];
            }
        }
    }
    return @array;
}

my @array = <banana apple orange pear>;
say bubble-sort(@array); # OUTPUT: «(apple banana orange pear)␤»

