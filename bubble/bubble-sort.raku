enum Order is export(<Less Same More>) {}

sub bubble-sort(@array) returns @array {
    loop (my $i = 0; $i < @array.end; $i++) {
        for @array.keys -> $j {
            next if $j == @array.end;  # skip last element
            my $order = @array[$j] cmp @array[$j + 1];
            if $order == Order::More {
                @array[$j, $j + 1] = @array[$j + 1, $j];
            }
        }
    }
    return @array;
}

my @array = <banana apple orange pear>;
say bubble-sort(@array); # OUTPUT: «(apple banana orange pear)␤»

