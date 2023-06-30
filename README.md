# Description 

Ensemble d'outil CLI construit avec https://github.com/Kimoja/generathor:
- Génère une CLI à partir d'un fichier JSON.
- Gère l'autocompletion
- Permet de définir des alias ZSH
- Peut être utiliser pour générer plusieurs CLI d'un coup (pas utilisé ici)

# Prerequis 

- ZSH
- Ruby 3.2.1

# Installation

- Copier le fichier `commands/dev.custo.example`, le renommer en `commands/dev.custo` et modifier les propriétés en fonction de vos besoins, notamment `workspace_path` qui doit pointer le chemin absolue du dossier du repo, `todo_path`, et `tags_paths` si vous voulez pas utiliser celui par défaut
- `bundle install`, pour installer les dépendances
- `./build`, pour build la CLI. En fonction de votre OS et environement vous pourriez être amené à modifie la configuration passé à Generathor depuis ce fichier de build

# Usage

`dev --help`

```bash
Commands:
  dev code                 # Open vscode project
  dev github               # Open Github repository
  dev help [COMMAND]       # Describe available commands or one specific command
  dev json SUBCOMMAND      # json Commands
  dev json eval to_eval    # Transforms passed or in clipboard JS or Ruby to JSON
  dev json format JSON     # Format passed or in clipboard JSON
  dev json help [COMMAND]  # Describe subcommands or one specific subcommand
  dev json to_ruby JSON    # Transforms passed or in clipboard JSON to Ruby
  dev kport PORTS          # Kills open processes on ports
  dev tag *TAGS            # Search by tags, format: tag1 tag2 tag3
  dev todo *TODO           # Add a todo and open the todolist file, format: my todo description
  dev tr SUBCOMMAND        # tr Commands
  dev tr en *TEXT          # Translate the text in English
  dev tr fr *TEXT          # Translate the text in french
  dev tr help [COMMAND]    # Describe subcommands or one specific subcommand
  dev zkrin                # Open Zkrin
```


# Configuration, customization

Les commandes sont définis dans le fichier `./commands/dev.json`.

Chaque commandes est soit évaluée en ruby depuis la propriété `eval` du JSON, soit lié à une classe ou méthode se trouvant dans le dossier `./lib/cli`.

Le namespace de la classe ou méthode doit suivre le chemin de la commande

Si une commandes nécessite beaucoup de code, le mieux est d'en faire une classe, sinon une méthode suffit ou une évaluation.

Les classes doivent définir la méthode `exec`

Les méthodes de commandes se nomment suivant le patter: `exec_[COMAND_NAME]`

On peut définir des getters pour les options et arguments de la commande via les méthodes de classe `arguments` et `config`

Pour ajouter une commande, il faut donc l'ajouter dans le fichier JSON puis définir le comportement dans une classe ou méthode ruby.

Si vous souhaiter utiliser cet outil, merci de fork le repo et d'indiquer dans ce readme le lien du fork