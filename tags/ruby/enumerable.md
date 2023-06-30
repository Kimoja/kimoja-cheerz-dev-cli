<gtags ruby enumerable>

<tags each_with_object each object hash>

 ## Créé un objet depuis un array
```ruby
%w(foo bar).each_with_object({}) { |str, hsh| hsh[str] = str.upcase }
# => {'foo' => 'FOO', 'bar' => 'BAR'}
```

</tags>

<tags key transform keys replace transform_keys>

 ## transform_keys
```ruby
{foo: 0, bar: 1, baz: 2}.transform_keys {|key| key.to_s } # => {"foo"=>0, "bar"=>1, "baz"=>2}
```

</tags>

<tags key transform values replace transform_values>

 ## transform_values
```ruby
{foo: "foo", bar: "bar"}.transform_values {|value| value.to_sym } # => {:foo=>:foo, :bar=>:bar}
```

</tags>

<tags count values value tally>

 ## tally
```ruby
["a", "b", "c", "b"].tally  #=> {"a"=>1, "b"=>2, "c"=>1}
```

</tags>

<tags count values value>

 ## each_cons
Iterates the given block for each array of consecutive <n> elements. If no block is given, returns an enumerator.
```ruby
(1..10).each_cons(3) { |a| p a }
# outputs below
[1, 2, 3]
[2, 3, 4]
[3, 4, 5]
[4, 5, 6]
[5, 6, 7]
[6, 7, 8]
[7, 8, 9]
[8, 9, 10]
```

</tags>

</gtags>