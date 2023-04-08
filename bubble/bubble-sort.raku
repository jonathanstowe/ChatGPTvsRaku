
sub bubble-sort(@data, &key-func = -> $x { $x }) {
    for ^@data.end -> $i {
        for ^($@data.end - $i) -> $j {
            if &key-func(@data[$j]) cmp &key-func(@data[$j + 1]) == Order::More {
                @data[$j, $j + 1] = @data[$j + 1, $j];
            }
        }
    }
    @data;
}

class Person {
    has $.name;
    has Int $.age;
}

my @people = (
    Person.new(name => 'Alice', age => 25),
    Person.new(name => 'Bob', age => 20),
    Person.new(name => 'Charlie', age => 30)
);

sub key-func($person) {
    $person.age;
}

say bubble-sort(@people, *.age); # Using WhateverCode
say bubble-sort(@people, &key-func); # Explicitly passing the subroutine

