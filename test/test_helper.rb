require 'rubygems'
require 'bundler/setup'
require 'minitest/reporters'
require_relative '../cal'

reporter_options = { color: true }

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

require 'minitest/autorun'
