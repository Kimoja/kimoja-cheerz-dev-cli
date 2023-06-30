# frozen_string_literal: true

module Toolbox
  module Concerns
    module Shell
      SHELL = Thor::Shell::Color.new

      def puts(msg)
        SHELL.say(msg)
      end

      def error(msg, ex = false)
        SHELL.say(msg, :red)
        return unless ex

        SHELL.say('Exiting...', :red)
        exit if ex
      end

      def ok(msg)
        SHELL.say(msg, :green)
      end

      def info(msg)
        SHELL.say(msg, :blue)
      end

      def warn(msg)
        SHELL.say(msg, :yellow)
      end

      def yes?(msg)
        SHELL.yes?(msg)
      end
    end
  end
end
