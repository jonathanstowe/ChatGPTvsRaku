sub bubble-sort(@array, &key-func = *.<key>) {
    for ^@array.end -> $i {
        my $swapped = False;
        for ^@array.end - $i -> $j {
            if key-func(@array[$j]) > key-func(@array[$j+1]) {
                @array[$j], @array[$j+1] = @array[$j+1], @array[$j];
                $swapped = True;
            }
        }
        last unless $swapped;
    }
    @array;
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

