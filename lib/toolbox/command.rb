# frozen_string_literal: true

module Toolbox
  class Command < Generathor::Command
    include Toolbox::Concerns::System
    include Toolbox::Concerns::Shell
    include Toolbox::Concerns::Clipboard
    include Toolbox::Concerns::Github
    include Toolbox::Concerns::Code

    class Arguments
      include Toolbox::Concerns::Clipboard
    end

    def exec_github
      system_open(github_url)
    end

    def exec_code
      open_vscode(config.workspace_path, '')
    end

    def exec_zkrin
      system_open(config.workspace_path, 'https://zkrin.cheerz.com/dashboards/tech-server')
    end

    def exec_kport
      system_exec("kill -9 $(lsof -ti:#{arguments.ports})")
    end
  end
end

require_relative './command/todo'
require_relative './command/tag'
require_relative './command/json'
require_relative './command/tr'