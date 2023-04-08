sub bubble-sort(@array, &key-func = *) {
    return @array unless @array.elems > 1;
    loop (my $i = @array.elems - 1; $i > 0; $i--) {
        my $swapped = False;
        for 0 ..^ $i -> $j {
            if (key-func(@array[$j]) cmp More key-func(@array[$j + 1])) {
                @array[$j, $j + 1] = @array[$j + 1, $j];
                $swapped = True;
            }
        }
        last unless $swapped;
    }
    @array
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
