sub bubble-sort(@array, &key-func = *{$^a}.&say, $order = Order::More) {
    my @cache = map { key-func($_) }, @array;
    my $size = @array.end;
    for 0..$size -> $i {
        for 0..^$size-$i -> $j {
            my $left = @cache[$j];
            my $right = @cache[$j + 1];
            my $cmp = $order == Order::More
                ?? $left cmp $right
                !! $right cmp $left;
            if $cmp == $order {
                @cache[$j, $j + 1] = @cache[$j + 1, $j];
                @array[$j, $j + 1] = @array[$j + 1, $j];
            }
        }
    }
    return @array;
}

class Person {
    has $.name;
    has Int $.age;
}

my @people = Person.new(name => 'Alice', age => 23),
             Person.new(name => 'Bob', age => 19),
             Person.new(name => 'Charlie', age => 42),
             Person.new(name => 'Dave', age => 31);

say bubble-sort(@people, &key-func = {.name}, $order = Order::Less).map(*.name);

