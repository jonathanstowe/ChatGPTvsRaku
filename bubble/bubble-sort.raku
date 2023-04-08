sub bubble-sort(@array, &key-func = *) {
    my $size = @array.elems;

    for my $i (0 ..^ $size) {
        for my $j (1 ..^ $size - $i) {
            my $a = @array[$j - 1];
            my $b = @array[$j];

            if key-func($a) cmp key-func($b) == More {
                @array[$j - 1, $j] = @array[$j, $j - 1];
            }
        }
    }

    return @array;
}

class Person {
    has Str $.name;
    has Int $.age;

    method gist() {
        "{$.name} ({$.age})"
    }
}

my @people = Person.new(name => "Alice", age => 25),
             Person.new(name => "Bob", age => 30),
             Person.new(name => "Charlie", age => 20);

say bubble-sort(@people, *.age);
