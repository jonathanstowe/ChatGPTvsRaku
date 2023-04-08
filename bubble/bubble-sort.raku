sub bubble-sort(@list) {
    my $n = @list.elems;
    for ^$n-1 -> $i {
        for ^$n-$i-1 -> $j {
            if @list[$j] > @list[$j+1] {
                @list[$j, $j+1] = @list[$j+1, $j];
            }
        }
    }
    return @list;
}

my @arr = (3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5);
say bubble-sort(@arr); # Output: [1 1 2 3 3 4 5 5 5 6 9]

