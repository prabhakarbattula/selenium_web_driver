require 'rubygems'
require "bundler"
Bundler.require

Dir["./test/helpers/**/*.rb"].each {|f| require f}
