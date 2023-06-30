<gtags ruby hash>

<tags key exist exists present>

 ## La clé existe ?
```ruby
hash.key?("user")
```

</tags>

<tags key transform keys replace transform_keys>

```ruby
{foo: 0, bar: 1, baz: 2}.transform_keys {|key| key.to_s } # => {"foo"=>0, "bar"=>1, "baz"=>2}
```

</tags>

<tags key transform values replace transform_values>

```ruby
{foo: "foo", bar: "bar"}.transform_values {|value| value.to_sym } # => {:foo=>:foo, :bar=>:bar}
```

</tags>

<tags count values value>

```ruby
["a", "b", "c", "b"].tally  #=> {"a"=>1, "b"=>2, "c"=>1}
```

</tags>

<tags count values value>

```ruby
["a", "b", "c", "b"].tally  #=> {"a"=>1, "b"=>2, "c"=>1}
```

</tags>

</gtags>