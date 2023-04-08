sub bubble-sort(@array, &key-func = *) {
    my $length = @array.elems;
    for 1..$length -> $i {
        for reverse $i..$length - 1 -> $j {
            if $key-func(@array[$j - 1]) cmp $key-func(@array[$j]) == More {
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
