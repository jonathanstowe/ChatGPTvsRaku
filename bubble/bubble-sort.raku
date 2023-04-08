enum Order is export(<Less Same More>);

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
    has Str $.name;
    has Int $.age;
}

my @numbers = 3, 5, 4, 9, 6, 3;
say bubble-sort(@numbers); # Output: [3 3 4 5 6 9]

my @people = Person.new(name => 'Alice', age => 25),
             Person.new(name => 'Bob', age => 20),
             Person.new(name => 'Charlie', age => 30);
say bubble-sort(@people, &key-func = *.name); # Output: [Person.new(name => "Alice", age => 25) Person.new(name => "Bob", age => 20) Person.new(name => "Charlie", age => 30)]

