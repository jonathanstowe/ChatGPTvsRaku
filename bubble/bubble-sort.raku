sub bubble-sort(@array, &key-func = *) {
    my @pairs = @array.map: { [$_, &key-func($_)] };
    for 1 .. @pairs.elems -> $i {
        for reverse $i .. @pairs.elems - 1 -> $j {
            if @pairs[$j-1][1] cmp @pairs[$j][1] == More {
                @pairs[$j-1, $j] = @pairs[$j, $j-1];
            }
        }
    }
    return @pairs.map({$^a[0]});
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
