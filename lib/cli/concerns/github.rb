# frozen_string_literal: true

module Cli
  module Concerns
    module Github
      def github_url
        "https://github.com/#{config.github_owner}/#{config.repo_name}"
      end
    end
  end
end
