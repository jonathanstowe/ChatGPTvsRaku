sub bubble-sort(@arr) {
    my $n = @arr.elems;
    for my $i (0..^$n-1) -> $j {
        for $j+1..^$n -> $k {
            if @arr[$k] < @arr[$j] {
                @arr[$j, $k] = @arr[$k, $j];
            }
        }
    }
    return @arr;
}

my @arr = (3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5);
say bubble-sort(@arr); # Output: [1 1 2 3 3 4 5 5 5 6 9]
