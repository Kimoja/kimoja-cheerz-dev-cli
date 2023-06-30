<gtags ops cmd cmds command commands>

<tags staging>
 
## Déploiement staging 
```bash
bundle exec cap staging1 deploy
```

</tags>


<tags free libérer>
 
## Libérer un serveur staging 
```bash
bundle exec cap staging1 free_server
```

</tags>

<tags prod production>
 
## Déploiement production 
```bash
bundle exec cap production deploy:pending
bundle exec cap production deploy
```

</tags>

<tags staging connection connexion>
 
## Connexion serveur
```bash
ssh kustom@ku-staging-web-1-dc2.cheerz.net
ssh kustom@ku-staging-web-2-dc5.cheerz.net
```

</tags>

<tags test dump local base db load>
 
## Monter la base de test chezer
```bash
bundle exec rake db:create db:schema:load db:seed RAILS_ENV=test 
```

</tags>

<tags ssh sshkit mac unix linux>
 
## Changer format local ip
```bash
sudo dos2unix -c mac /private/etc/hosts
```

</tags>


<tags prettier yarn lint linter>
 
## Executer prettier / linter yarn js 
```bash
npx prettier --write . 
```

</tags>


<tags restore db mount>
 
## Réinit la base en local, attention, c'est long !
```bash
./bin/rails db:environment:set RAILS_ENV=development dump:retrieve dump:import dump:after_import dump:restore_assets
```

</tags>

</gtags>
