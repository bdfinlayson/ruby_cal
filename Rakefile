#!/usr/bin/env ruby
# -*- ruby -*-

require 'rake/clean'
require 'rake/testtask'
require 'minitest/autorun'

task :default => :test

Rake::TestTask.new() do |config|
  config.pattern = "test/test_*.rb"
end
