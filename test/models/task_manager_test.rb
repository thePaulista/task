require_relative "../test_helper"

class TaskManagerTest < Minitest::Test
  include TestHelper

  def test_can_create_a_task
    data = {
      title:  "some title",
      description: "some description"
    }

    task_manager.create(data)

    task = task_manager.all.last #getting the last item from the array

    assert task.id
    assert_equal "some title", task.title
    assert_equal "some description", task.description
  end

  def test_all_can_create_an_array_of_task
    data1= {
        title:  "some title",
        description: "some description"
      }

      data2 = {
        title:  "new title",
        description: "new description"
      }

      d1 = task_manager.create(data1)
      d2 = task_manager.create(data2)

      assert_equal 2, task_manager.all.count
  end

  def test_it_can_locate_by_id
    data1= {
        title:  "some title",
        description: "some description"
      }

      data2 = {
        title:  "new title",
        description: "new description"
      }

      task_manager.create(data1)
      task_manager.create(data2)

      assert_equal "some title", task_manager.find(1).title
      assert_equal "new title", task_manager.find(2).title
  end

  def test_it_can_update_data
    data1= {
        title:  "some title",
        description: "some description"
      }

    data2 = {
        title:  "new title",
        description: "new description"
      }

    d1 = task_manager.create(data1)
    d2 = task_manager.create(data2)

    assert_equal "some title", d1.first["title"]
    d1.first['title'] = ["updated title"]

    task_manager.update(d1.first["id"], d1.first)

    assert_equal "updated title", d1.first["title"]

  end

end
#
# def create_tasks(num)
#    num.times do |i|
#      task_manager.create({
#        title:       "a title #{i+1}",
#        description: "a description #{i+1}"
#        })
#    end
#  end
#
#  def test_it_can_find_a_specific_task_by_id
#    create_tasks(3)
#    task = task_manager.find(2)
#    assert_equal Task, task.class
#    assert_equal "a title 2", task.title
#    assert_equal "a description 2", task.description
#    assert_equal 2, task.id
#  end
