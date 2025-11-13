require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @task = tasks(:one)
    post login_path, params: { email: @user.email, password: 'password' }
  end

  test "should get index" do
    get tasks_path
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_path, params: { 
        task: { 
          title: "Nueva tarea", 
          description: "Descripción", 
          due_date: 1.day.from_now 
        } 
      }
    end
    assert_redirected_to tasks_path
  end
end

