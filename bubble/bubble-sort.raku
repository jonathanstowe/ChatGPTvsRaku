sub bubble-sort(@arr) {
    my $n = @arr.elems;
    loop (my $i = 0; $i < $n - 1; $i++) {
        loop (my $j = 0; $j < $n - $i - 1; $j++) {
            if @arr[$j] > @arr[$j+1] {
                @arr[$j, $j+1] = @arr[$j+1, $j];
            }
        }
    }
    return @arr;
}

my @arr = (3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5);
say bubble-sort(@arr); # Output: [1 1 2 3 3 4 5 5 5 6 9]

