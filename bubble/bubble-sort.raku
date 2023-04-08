sub bubble-sort(@array, &key-func = * ) {
    my $n = @array.elems;
    for my $i (0..^$n-1) -> $last_swap {
        my $swapped = False;
        for ($n - 1).reverse.grep($i ..^ *) -> $j {
            if key-func(@array[$j]) < key-func(@array[$j - 1]) {
                @array[$j, $j - 1] = @array[$j - 1, $j];
                $swapped = True;
                $last_swap = $j;
            }
        }
        last unless $swapped;
    }
    return @array;
}

class Person {
    has Str $.name;
    has Int $.age;
    method Str { $!name }
}

my @people = Person.new(name => 'Alice', age => 25),
             Person.new(name => 'Bob', age => 35),
             Person.new(name => 'Charlie', age => 30);

my @sorted-people = bubble-sort(@people, *.name);

say $_.name for @sorted-people; # Alice Bob Charlie

