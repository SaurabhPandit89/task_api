# frozen_string_literal: true

require 'test_helper'

class TaggedTaskTest < ActiveSupport::TestCase
  # VALIDATE PRESENCE & UNIQUENESS OF TAG_ID & TASK_ID
  test 'should not create tagged_task when task_id is not pressent' do
    assert_not tagged_tasks(:no_task_id).save
  end

  test 'should not create tagged_task when tag_id is not pressent' do
    assert_not tagged_tasks(:no_tag_id).save
  end

  test 'should not create tagged_task when task_id & tag_id are not pressent' do
    assert_not tagged_tasks(:no_ids).save
  end

  test 'should create tagged_task when task_id & tag_id are pressent' do
    assert TaggedTask.new(tag_id: 5, task_id: 5).save
  end
end
