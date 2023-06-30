# frozen_string_literal: true
require "tempfile"

module Cli
  class Command
    class Tag < Cli::Command
      config(:tags_paths) do |tags_paths|
        tags_paths
          .map { |path| binding.eval("\"#{path}\"") }
          .map { |path| "#{path}/**/*" }
      end

      def exec
        tag_finder = TagsFinder.new(
          search_tags: arguments.tags,
          search_globs: config.tags_paths,
          result_size: 10
        )

        tag_finder.find do |results_slice|
          tmps_name = ["#{@arguments.tags}", '.md']

          ::Tempfile.create(tmps_name) do |tmp_file|
            results_slice.each do |result|
              IO.write(
                tmp_file.path,
                extract_result(result),
                mode: 'a'
              )
            end

            open_vscode(tmp_file.path)
            return unless yes?('Press [y] to continue')
          end
        end
      rescue Interrupt
        warn("\nExiting...")
      end

      def extract_result(result)
        <<~TEXT
          ## Tags: #{result.tags * ' '}

          - **score**: #{result.score}
          - `code --goto #{result.path}:#{result.start_line}`

          #{result.extract}

          ------------------------------------------------------
        TEXT
      end
    end
  end
end
