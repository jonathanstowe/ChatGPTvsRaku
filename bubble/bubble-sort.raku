sub bubble-sort(@array, &key-func = *) {
    my $n = @array.elems;
    my @pairs = @array.map({ $_ => &key-func($_) }); # create array of tuples
    for 1..$n -> $i {
        for reverse $i..^$n -> $j {
            if @pairs[$j-1][1] cmp More @pairs[$j][1] { # compare keys
                @pairs[$j-1], @pairs[$j] = @pairs[$j], @pairs[$j-1]; # swap tuples
            }
        }
    }
    return @pairs.map(*[0]); # return sorted original values
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
