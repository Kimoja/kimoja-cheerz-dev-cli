<gtags ruby json>

<tags read load parse>

 ## Parse le json
```ruby
require "json"
data_hash = JSON.parse(string)
```

</tags>

<tags read load parse format sym symbolize>

 ## Parse le json avec clé symbol
```ruby
require "json"
data_hash = JSON.parse(string, symbolize_names: true)
```

</tags>

<tags fs parse load read>

 ## Parse le fichier json
```ruby
require "json"
data_hash = JSON.parse(File.read("./file-name-to-be-read.json"))
```

</tags>

<tags serialize dump stringify>

 ## Serialize le hash/array/object
```ruby
require "json"
str = JSON.dump(data_hash)
```

</tags>

<tags serialize dump stringify format>

 ## Serialize le hash/array/object, joliement !
```ruby
require "json"
str = JSON.pretty_generate(data_hash)
```

</tags>

<tags fs serialize dump stringify>

 ## Serialize le hash/array/object dans un fichier
```ruby
require "json"
File.write('./sample-data.json', JSON.dump(data_hash))
```

</tags>

</gtags>