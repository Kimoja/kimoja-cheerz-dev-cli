# frozen_string_literal: true

module Toolbox
  class Command
    class Json < Toolbox::Command
      arguments(:to_eval) { |to_eval| to_eval || clipboard_paste }
      arguments(:json) { |json| json || clipboard_paste }

      def exec_eval
        json = JSON.pretty_generate(eval(arguments.to_eval))

        info('Formated JSON:')
        puts(json)

        clipboard_copy(json)
      end

      def exec_format
        json = JSON.pretty_generate(JSON.parse(arguments.json))

        info('Formated JSON:')
        puts(json)

        clipboard_copy(json)
      end

      def exec_to_ruby
        json = json_to_ruby(JSON.pretty_generate(JSON.parse(arguments.json)))

        info('Formated JSON:')
        puts(json)

        clipboard_copy(json)
      end

      private def json_to_ruby(json)
        json.gsub(/(?:"|')(?<key>[^"]*)(?:"|')(?=:)(?::)/) do |_|
          "#{Regexp.last_match(:key)}:"
        end
      end
    end
  end
end
