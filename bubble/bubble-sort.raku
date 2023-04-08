sub bubble-sort(@array, &key-func = *{$^a}) {
    my $length = @array.end;
    for 0..^$length -> $i {
        for $length ... $i + 1 ...^ $length -> $j {
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
