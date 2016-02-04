require_relative '../test_helper'

class HomePageGreetingTest < Minitest::Test
  include Capybara::DSL
  #the above includes visits, etc
  def test_home_page_welcomes_user
    #as a user
    #when i visit the home page
    visit '/'
    save_and_open_page
    #then i see "welcome to the TaskManager"
    within("#greeting") do
      assert page.has_content?("Welcome to the Task Manager")
    end
  end
end
