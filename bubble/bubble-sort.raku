sub bubble-sort(@array, &key-func = *{$^a}) {
    my $n = @array.elems;
    loop (my $i = 0; $i < $n - 1; $i++) {
        my $swapped = False;
        for 1 ..^ $n - $i -> $j {
            if (key-func(@array[$j - 1]) cmp More key-func(@array[$j])) {
                @array[$j - 1, $j] = @array[$j, $j - 1];
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

