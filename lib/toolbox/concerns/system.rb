# frozen_string_literal: true

module Toolbox
  module Concerns
    module System
      def system_open(path)
        system_exec("open #{path}")
      end

      def system_exec(cmd)
        raise "Unable to execute command: #{cmd}" unless system(cmd)
      end
    end
  end
end
