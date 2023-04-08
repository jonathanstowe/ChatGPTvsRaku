sub bubble-sort(@array, &key-func = *) {
    my $last = @array.end;
    for 0 ..^ $last -> $i {
        for reverse $i + 1 ..^ $last -> $j {
            my $left  = @array[$j - 1];
            my $right = @array[$j];
            if key-func($left) cmp key-func($right) == More {
                @array[$j - 1, $j] = $right, $left;
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

say bubble-sort(@people, -> $v { $v.age } ).perl;
