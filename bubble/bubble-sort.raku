sub bubble-sort(@array, Code:D $key-func = { $^a }) {
    my $n = @array.elems;
    loop (my $i = 0; $i < $n - 1; $i++) {
        my $swapped = False;
        loop (my $j = 0; $j < $n - $i - 1; $j++) {
            if $key-func(@array[$j]) cmp $key-func(@array[$j + 1]) == Order::More {
                @array[$j], @array[$j + 1] = @array[$j + 1], @array[$j];
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
}

my @people = Person.new(name => "Alice", age => 23),
             Person.new(name => "Bob", age => 32),
             Person.new(name => "Charlie", age => 18);

my @people_sorted_by_name = bubble-sort(@people, &key-func({ $^person.name }));
my @people_sorted_by_age = bubble-sort(@people, &key-func({ $^person.age }));

say "People sorted by name:";
say $_.name for @people_sorted_by_name;
say "";
say "People sorted by age:";
say $_.name for @people_sorted_by_age;

