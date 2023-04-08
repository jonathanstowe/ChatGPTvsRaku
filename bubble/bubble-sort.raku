sub bubble-sort(@array, &key-func = *) {
    my $n = @array.elems;
    for my $i (0..^$n) {
        my $swapped = False;
        for my $j (0..^$n - $i - 1) {
            if ($j + 1) >= $n {
                last;
            }
            if (key-func(@array[$j]) cmp More key-func(@array[$j + 1])) == More {
                @array[$j, $j + 1] = @array[$j + 1, $j];
                $swapped = True;
            }
        }
        last unless $swapped;
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
