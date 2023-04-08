sub bubble-sort(@array, &key-func = *) {
    my $size = @array.elems;
    my $last = $size - 1;

    loop (my $i = 0; $i < $last; $i++) {
        my $swaps = False;

        for my $j (0 .. $last - $i - 1) {
            if (key-func(@array[$j]) cmp key-func(@array[$j+1])) == More {
                @array[$j,$j+1] = @array[$j+1,$j];
                $swaps = True;
            }
        }

        last unless $swaps;
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

my @people = Person.new(name => "Alice", age => 25),
             Person.new(name => "Bob", age => 30),
             Person.new(name => "Charlie", age => 20);

say bubble-sort(@people, &key-func = *.age);
