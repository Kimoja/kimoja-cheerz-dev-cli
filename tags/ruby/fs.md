<gtags ruby fs>

ressource:
- https://www.rubyguides.com/2015/05/working-with-files-ruby/

<tags file read>

 ## Lire un fichier
```ruby
File.open("users.txt").read
```

</tags>

<tags file read lines>

 ## Lire ligne par ligne 
```ruby
File.open("users.txt").readlines.map {}
# !! Fermer le fichier ensuite
File.open("users.txt").close
```

</tags>

<tags file write add>

 ## Ajoute à la fin du fichier
```ruby
File.write("log.txt", "data...", mode: "a")
```

</tags>

<tags file write rewrite create>

## Remplace le contenue du fichier

```ruby
File.write("log.txt", "data...") ## mode par default: w
```

</tags>

<tags fle rename>

## Renomme le fichier
```ruby
File.rename("old-name.txt", "new-name.txt")
```

</tags>

<tags file size>

 ## Taille du fichier
```ruby
File.size("users.txt")
```

</tags>

<tags file exists exists>

 ## Le fichier existe t-il
```ruby
File.exists?("log.txt")
```

</tags>

<tags file extension ext extname>

 ## Retourne l'extension du fichier
```ruby
File.extname("users.txt")
```

</tags>

<tags file basename base name>

 ## Le nom du fichier sans ext
```ruby
File.basename("/tmp/ebook.pdf")
```

</tags>

<tags dir dirname name base>

 ## Nom du dossier sans fichier
```ruby
File.dirname("/tmp/ebook.pdf")
```

</tags>

<tags dir files list>

 ## Liste les fichiers d'un dossier
```ruby
Dir["#{__dir__}/config/**"]
```

</tags>

<tags directory file dir is>

 ## C'est un dossier ?
```ruby
File.directory?("cats")
```

</tags>

<tags delete remove file>

 ## Supprimer un fichier
```ruby
File.delete(path_to_file) if File.exist?(path_to_file)
```

</tags>

<tags path expand absolute>

 ## Generate Absolute File Path In Ruby
```ruby
File.expand_path('example.rb')
```

</tags>

<tags glob search>

 ## Pattern de recherche
```ruby
# All files in current directory
Dir.glob("*")
# All files containing "spec" in the name
Dir.glob("*spec*")
# All ruby files
Dir.glob("*.rb")
# recursively list all files in Ruby, starting from the current directory
Dir.glob("**/**")
# only search for directories
Dir.glob("**/**/")
```

</tags>

<tags dir directory current pwd>

 ## Le répertoire courrant
```ruby
Dir.pwd
```

</tags>

<tags dir directory empty>

 ## Le dossier est vide ?
```ruby
Dir.empty?("/tmp")
```

</tags>

<tags dir directory exist>

 ##  Le dossier existe ?
```ruby
Dir.exists?("/tmp")
```

</tags>

<tags dir directory create mkdir>

 ## Créer un dossier
```ruby
Dir.mkdir("/tmp/testing")
```

</tags>

<tags dir directory create mkdir tmp temp>

 ## Crééer un dossier temporraire
```ruby
Dir.mktmpdir do |dir|
  File.write(dir + "/log.txt", "test")
end
```

</tags>

<tags file compare>

 ## 
```ruby
require "fileutils"
FileUtils.compare_file("a.txt", "b.txt")
```

</tags>

<tags file touch>

 ## Touche un fichier
```ruby
require "fileutils"
FileUtils.touch("/tmp/lock")
```

</tags>

<tags dir directory copy recursive>

 ## Copie un dossier
```ruby
require "fileutils"
FileUtils.cp_r("data", "backup")
```

</tags>

<tags delete remove dir>

 ## Supprimer un dossier récursivement
```ruby
require "fileutils"
FileUtils.rm_rf("#{dir_path}/.", secure: true)
```

</tags>

<tags create dir path recursive>

 ## Créé un dossier/chemin
```ruby
require "fileutils"
FileUtils.mkdir_p(zsh_sources_path)
```

</tags>

</gtags>