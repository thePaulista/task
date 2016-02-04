# require 'bundler'
# Bundler.require

# $LOAD_PATH.unshift(File.expand_path("app", __dir__))

# require 'controllers/task_manager_app'
require File.expand_path('../config/environment.rb', __FILE__)

run TaskManagerApp
