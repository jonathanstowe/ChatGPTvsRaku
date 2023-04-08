sub bubble-sort(@array, &key-func = *{$^a}) {
    my $n = @array.end;
    my $swapped;
    do {
        $swapped = False;
        for 1 ..^ $n -> $i {
            if key-func(@array[$i-1]) More key-func(@array[$i]) {
                @array[$i-1,$i] = @array[$i,$i-1];
                $swapped = True;
            }
        }
        $n--;
    } while $swapped && $n >= 0;
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

