#!/usr/bin/env ruby

require 'rake/clean'
require 'rake/testtask'
require './application'

task :default => :execute

task :test do
  sh "bundle exec rspec ."
end

task :execute, [:command_files] do |t, args|
  args.with_defaults(:command_files => Dir.glob("./command/*.txt"))
  Simulator.execute(args[:command_files])
end
