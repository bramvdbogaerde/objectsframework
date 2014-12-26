require 'bundler'
Bundler.require
require './todo'
require './db'
require './app'

run ObjectsFramework::Server.new
