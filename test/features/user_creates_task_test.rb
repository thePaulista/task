require_relative '../test_helper'

class UserCreatesTaskTest < Minitest::Test
  include Capybara::DSL #to include visits, etc

  def test_with_valid_attributes
    #task_manager.create(this is faster)

    # As a user
    #When I visit the home page
    visit '/'
    # save_and_open_page
    #And I click "NewTask:"
    click_link("New Task")
    #And I fill in the title
    fill_in('task[title]', with: "My fun task")
    #And I fill in the description
    fill_in('task[description]', with: 'so much fun')
    #And I click Submit
    click_button "Submit"

    assert_equal "/tasks", current_path
    #Then I should see my task
    within("#tasks") do
      assert page.has_content?("My fun task")
    end
  end

end

#user story
# require_relative '../test_helper'
#
# class UserCreatesTaskTest < Minitest::Test
#   include Capybara::DSL
#   include TestHelpers
#
#   def test_with_valid_attributes
#     visit '/'
#
#     click_link("New task")
#     fill_in("task[title]", with: "My fun task")
#     fill_in("task[description]", with: "so much fun")
#     click_button("Submit")
#
#     assert_equal "/tasks", current_path
#
#     within("#tasks") do
#       assert page.has_content?("My fun task")
#     end
#   end
# end
