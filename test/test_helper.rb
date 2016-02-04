# require File.expand_path('../../config/environment', __FILE__)
# require 'minitest/autorun'
# require 'minitest/pride'
#
ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'tilt/erb'
require 'capybara/dsl'
require 'tilt/erb'

Capybara.app = TaskManagerApp

Capybara.save_and_open_page_path = "tmp/capybara"

module TestHelper
  def teardown
    task_manager.delete_all
    super
  end

  def task_manager
    database = YAML::Store.new('db/task_manager_test')
    @task_manager ||= TaskManager.new(database)
  end
end
