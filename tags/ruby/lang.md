<gtags ruby lang>

<tags switch case>

 ## Switch statement
```ruby
case x
when 1..5
  "It's between 1 and 5"
when 6
  "It's 6"
when "foo", "bar"
  "It's either foo or bar"
when String
  "You passed a string"
else
  "You gave me #{x} -- I have no idea what to do with that."
end
```

</tags>

<tags each object>

```ruby
%w(foo bar).each_with_object({}) { |str, hsh| hsh[str] = str.upcase }
```

</tags>


<tags const get const_get>

```ruby
Object.const_get('Foo::Bar')
```

</tags>

</gtags>