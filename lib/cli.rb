# frozen_string_literal: true

require 'bundler'
Bundler.setup(:default)

require 'generathor'
require 'tags_finder'
require 'clipboard'
require 'faraday'

module Cli; end

require_relative 'cli/concerns'
require_relative 'cli/command'
