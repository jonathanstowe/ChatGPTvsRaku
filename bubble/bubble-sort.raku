sub bubble-sort(@array, &key-func = *{$^a} <=> *{$^b}) {
    my @tuples = map { $_, key-func($_) }, @array;
    for ^@tuples.end -> $i {
        for ^(@tuples.end - $i) -> $j {
            if @tuples[$j; 1] > @tuples[$j + 1; 1] {
                @tuples[$j, $j + 1] = @tuples[$j + 1, $j];
            }
        }
    }
    return @tuples>>[0];
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

