dev() {
  if false; then
    echo "Evaluation of the command: "dev $@""
    local cmd=$(BUNDLE_GEMFILE=/Users/joakimcarrilho/dev/tools/toolbox/kimoja-cheerz-dev-cli/Gemfile /Users/joakimcarrilho/dev/tools/toolbox/kimoja-cheerz-dev-cli/bin/dev "$@")
    eval $cmd
  else
    BUNDLE_GEMFILE=/Users/joakimcarrilho/dev/tools/toolbox/kimoja-cheerz-dev-cli/Gemfile /Users/joakimcarrilho/dev/tools/toolbox/kimoja-cheerz-dev-cli/bin/dev "$@"
  fi
}
export "dev"

#compdef dev
# shellcheck disable=SC2034
# https://github.com/koalaman/shellcheck/wiki/SC2034

_dev() {
  __dev
}

__dev() {
  readonly local DEPTH=2

  case $CURRENT in
    "$DEPTH")
      _arguments \
        '*: :->subcommands'

      case ${state:?} in
        subcommands)
          _values \
            'subcommand' \
            'code[Open vscode project]' \
            'gh[Open Github repository]' \
            'srv[Open Zkrin]' \
            'kport[Kills open processes on given ports]' \
            'todo[Add a todo and open the todolist file, format: dev todo description of my todo]' \
            'tag[Search by tags, format: dev tag tag1 tag2 tag3]' \
            'json[json Commands]' \
            'tr[tr Commands]' \
            ;
          ;;
      esac
      ;;
    *)
      case ${words[$DEPTH]:?} in
        code)
          __dev_code
          ;;
        gh)
          __dev_gh
          ;;
        srv)
          __dev_srv
          ;;
        kport)
          __dev_kport
          ;;
        todo)
          __dev_todo
          ;;
        tag)
          __dev_tag
          ;;
        json)
          __dev_json
          ;;
        tr)
          __dev_tr
          ;;
        *)
          # if does not match any subcommand
          # complete rest arguments
          _files
          ;;
      esac
      ;;
  esac
}


__dev_code() {
  _arguments \
    '*: :->rest'

  case ${state:?} in
    rest)
      # complete rest arguments
      _files
      ;;
  esac
}

__dev_gh() {
  _arguments \
    '*: :->rest'

  case ${state:?} in
    rest)
      # complete rest arguments
      _files
      ;;
  esac
}

__dev_srv() {
  _arguments \
    '*: :->rest'

  case ${state:?} in
    rest)
      # complete rest arguments
      _files
      ;;
  esac
}

__dev_kport() {
  _arguments \
    '*: :->rest'

  case ${state:?} in
    rest)
      # complete rest arguments
      _files
      ;;
  esac
}

__dev_todo() {
  _arguments \
    '*: :->rest'

  case ${state:?} in
    rest)
      # complete rest arguments
      _files
      ;;
  esac
}

__dev_tag() {
  _arguments \
    '*: :->rest'

  case ${state:?} in
    rest)
      # complete rest arguments
      _files
      ;;
  esac
}

__dev_json() {
  readonly local DEPTH=3

  case $CURRENT in
    "$DEPTH")
      _arguments \
        '*: :->subcommands'

      case ${state:?} in
        subcommands)
          _values \
            'subcommand' \
            'format[Format passed or in clipboard JSON]' \
            'to-ruby[Transforms passed or in clipboard JSON to Ruby]' \
            'eval[Transforms passed or in clipboard JS or Ruby to JSON]' \
            'help[Describe subcommands or one specific subcommand]' \
            ;
          ;;
      esac
      ;;
    *)
      case ${words[$DEPTH]:?} in
        format)
          __dev_json_format
          ;;
        to-ruby)
          __dev_json_to-ruby
          ;;
        eval)
          __dev_json_eval
          ;;
        help)
          __dev_json_help
          ;;
        *)
          # if does not match any subcommand
          # complete rest arguments
          _files
          ;;
      esac
      ;;
  esac
}


__dev_json_format() {
  _arguments \
    '*: :->rest'

  case ${state:?} in
    rest)
      # complete rest arguments
      _files
      ;;
  esac
}

__dev_json_to-ruby() {
  _arguments \
    '*: :->rest'

  case ${state:?} in
    rest)
      # complete rest arguments
      _files
      ;;
  esac
}

__dev_json_eval() {
  _arguments \
    '*: :->rest'

  case ${state:?} in
    rest)
      # complete rest arguments
      _files
      ;;
  esac
}

__dev_json_help() {
  _arguments \
    '*: :->rest'

  case ${state:?} in
    rest)
      # complete rest arguments
      _files
      ;;
  esac
}

__dev_tr() {
  readonly local DEPTH=3

  case $CURRENT in
    "$DEPTH")
      _arguments \
        '*: :->subcommands'

      case ${state:?} in
        subcommands)
          _values \
            'subcommand' \
            'en[Translate the text in English]' \
            'fr[Translate the text in french]' \
            'help[Describe subcommands or one specific subcommand]' \
            ;
          ;;
      esac
      ;;
    *)
      case ${words[$DEPTH]:?} in
        en)
          __dev_tr_en
          ;;
        fr)
          __dev_tr_fr
          ;;
        help)
          __dev_tr_help
          ;;
        *)
          # if does not match any subcommand
          # complete rest arguments
          _files
          ;;
      esac
      ;;
  esac
}


__dev_tr_en() {
  _arguments \
    '*: :->rest'

  case ${state:?} in
    rest)
      # complete rest arguments
      _files
      ;;
  esac
}

__dev_tr_fr() {
  _arguments \
    '*: :->rest'

  case ${state:?} in
    rest)
      # complete rest arguments
      _files
      ;;
  esac
}

__dev_tr_help() {
  _arguments \
    '*: :->rest'

  case ${state:?} in
    rest)
      # complete rest arguments
      _files
      ;;
  esac
}


compdef _dev dev

alias todo="dev todo"
alias tag="dev tag"
alias json="dev json"
alias en="dev tr en"
alias fr="dev tr fr"
