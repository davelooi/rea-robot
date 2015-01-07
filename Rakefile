#!/usr/bin/env ruby

require 'rake/clean'
require 'rake/testtask'

task :default => :execute

task :test do
  sh "bundle exec rspec ."
end

task :execute, [:command_files] do |t, args|
  require './simulator'
  args.with_defaults(:command_files => Dir.glob("./command/*.txt"))
  Simulator.execute(args[:command_files])
end
