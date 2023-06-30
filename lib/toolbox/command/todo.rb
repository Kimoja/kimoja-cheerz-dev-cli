# frozen_string_literal: true

module Toolbox
  class Command
    class Todo < Toolbox::Command
      config(:todo_path) do |todo_path|
        binding.eval("\"#{todo_path}\"")
      end

      def exec
        unless arguments.todo.empty?
          File.write(
            config.todo_path,
            "\n- [ ] #{arguments.todo * ' '}",
            mode: 'a'
          )
        end

        open_vscode(config.todo_path, '')
      end
    end
  end
end
