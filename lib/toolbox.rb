# frozen_string_literal: true

require 'bundler'
Bundler.setup(:default)

require 'generathor'
require 'tags_finder'
require 'clipboard'
require 'faraday'

module Toolbox; end

require_relative 'toolbox/concerns'
require_relative 'toolbox/command'
