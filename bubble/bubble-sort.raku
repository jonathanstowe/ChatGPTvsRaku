sub bubble-sort(@array, &key-func = *) {
    my $n = @array.elems;
    for my $i (0..^$n) -> $i-index {
        for my $j ($n-1 ... $i-index ... 1) -> $j-index {
            if key-func(@array[$j - 1]) cmp key-func(@array[$j]) == More {
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

say bubble-sort(@people, &key-func = *.age);
