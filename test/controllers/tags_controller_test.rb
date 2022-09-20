# frozen_string_literal: true

require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  # INDEX -> test for index method
  test 'should get index' do
    get tags_url, as: :json
    assert_response :success
  end
end
