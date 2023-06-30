# frozen_string_literal: true

module Toolbox
  module Concerns
    module Code
      def open_vscode(file, options = '-r')
        `code --goto #{options} '#{file}'`
        info("Open vscode: '#{file}'")
      end
    end
  end
end
