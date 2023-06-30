# frozen_string_literal: true

module Cli
  class Command < Generathor::Command
    include Cli::Concerns::System
    include Cli::Concerns::Shell
    include Cli::Concerns::Clipboard
    include Cli::Concerns::Github
    include Cli::Concerns::Code

    class Arguments
      include Cli::Concerns::Clipboard
    end
  end
end

require_relative './command/todo'
require_relative './command/tag'
require_relative './command/json'
require_relative './command/tr'