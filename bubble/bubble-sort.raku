sub bubble-sort(@array, &key-func = *) {
    my $size = @array.elems;
    for 0..^$size -> $i {
        for 0..^($size - $i - 1) -> $j {
            if key-func(@array[$j]) cmp key-func(@array[$j + 1]) == More {
                @array[$j, $j + 1] = @array[$j + 1, $j];
            }
        }
    }
    @array;
}

class Person {
    has Str $.name;
    has Int $.age;

    method gist() {
        "{$.name} ({$.age})"
    }
}

my @people = Person.new(name => "Alice", age => 30),
             Person.new(name => "Bob", age => 25),
             Person.new(name => 'Lucy', age => 5 ),
             Person.new(name => "Charlie", age => 20);

say bubble-sort(@people, -> $v { $v.age } ).perl;
