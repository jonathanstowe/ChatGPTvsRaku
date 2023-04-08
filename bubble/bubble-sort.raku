sub bubble-sort(@list, &key-func = -> $x { $x }) {
    my $size = @list.elems;
    for 1..$size-1 -> $i {
        for reverse $i..$size-1 -> $j {
            if $key-func(@list[$j]) cmp $key-func(@list[$j-1]) == Order::Less {
                @list[$j-1,$j] = @list[$j,$j-1];
            }
        }
    }
    @list;
}

class Person {
    has $.name;
    has $.age;
}

my @people = Person.new(name => 'Alice', age => 25),
             Person.new(name => 'Bob', age => 35),
             Person.new(name => 'Charlie', age => 20);

my @sorted-people = bubble-sort(@people, { $_.age });
say @sorted-people.map({ $_.name }); # prints "Charlie Bob Alice"

