# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:two)
  end

  # INDEX -> test for index method
  test 'should get index' do
    get tasks_url, as: :json
    assert_response :success
  end

  # CREATE -> test for create method
  test 'should create task' do
    assert_difference('Task.count') do
      post tasks_url, params: { title: @task.title }, as: :json
    end
    assert_response 201
  end

  # SHOW -> test for show method
  test 'should show task' do
    get task_url(@task), as: :json
    assert_response :success
  end

  # UPDATE -> test for update method
  test 'should update task' do
    patch task_url(@task), params: { title: @task.title }, as: :json
    assert_response 200
  end

  # DESTROY -> test for destroy method
  test 'should destroy task' do
    assert_difference('Task.count', -1) do
      delete task_url(@task), as: :json
    end
    assert_response 204
  end
end
