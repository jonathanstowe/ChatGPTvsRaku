sub bubble-sort(@arr) {
    my $n = @arr.elems;
    for @arr.keys -> $i {
        for ^($n - $i - 1) -> $j {
            if @arr[$j] > @arr[$j + 1] {
                @arr[$j], @arr[$j + 1] = @arr[$j + 1], @arr[$j];
            }
        }
    }
    return @arr;
}

my @arr = (3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5);
say bubble-sort(@arr); # Output: [1 1 2 3 3 4 5 5 5 6 9]

