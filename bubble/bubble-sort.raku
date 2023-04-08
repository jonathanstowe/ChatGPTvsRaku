sub bubble-sort(@array, &key-func = *{$^a}) is export {
    my $n = @array.elems;
    for my $i (0..^$n-1) {
        my $swapped = False;
        for my $j (1..^$n-$i) {
            my $k1 = @array[$j - 1];
            my $k2 = @array[$j];
            if key-func($k1) cmp key-func($k2) == More {
                @array[$j - 1, $j] = $k2, $k1;
                $swapped = True;
            }
        }
        last unless $swapped;
    }
    return @array;
}

class Person {
    has Str $.name;
    has Int $.age;
}

my @people = (
    Person.new(name => "Alice", age => 25),
    Person.new(name => "Bob", age => 30),
    Person.new(name => "Charlie", age => 20)
);

sub get-age(Person $p) { $p.age }

say bubble-sort(@people, &get-age);

