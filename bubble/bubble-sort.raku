sub bubble-sort(@array, &key-func = * ) {
    my $n = @array.elems;
    for ^$n - 1 -> $i {
        for $n - 1 ... $i + 1 -> $j {
            if key-func(@array[$j - 1]) cmp key-func(@array[$j]) == More {
                @array[$j, $j - 1] = @array[$j - 1, $j];
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
