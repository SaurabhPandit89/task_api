# frozen_string_literal: true

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # VALIDATES PRESENCE OF -> tests to validate presence of task title
  test 'should not save task without title' do
    assert_not tasks(:no_title).save
  end

  test 'should save task with title' do
    assert tasks(:two).save
  end

  # CREATE_TAGS -> tests to test create_tags callback method from Task model
  test 'create_tags should be able to create tags' do
    task_tags = tasks(:four).create_tags
    task_tags.each do |task_tag|
      assert_equal task_tag, Tag.where('name in (?)', task_tag)[0].name
    end
  end

  test 'create_tags should not create hash_tags which are already present in tags' do
    task1 = tasks(:four).create_tags
    task1_string_tag_id = Tag.tag_id(task1[0])[0]
    task2 = Task.new(title: 'Should not create #string tag again').create_tags
    task2_string_tag_id = Tag.tag_id(task2[0])[0]
    assert_equal task1_string_tag_id, task2_string_tag_id
  end

  # BUILD_TAGGED_TASKS -> tests to test build_tagged_tasks method from Task model
  test 'should be able to build tagged_tasks object' do
    task = tasks(:three)
    tags = task.create_tags
    tag_ids = []
    tags.each { |tag| tag_ids << Tag.tag_id(tag)[0] }
    assert_equal tag_ids, task.build_tagged_tasks.pluck(:tag_id)
  end

  # GET_HASH_TAGS -> tests to test get_hash_tags private method from Task Model
  test 'get_hash_tags to return blank array if title is nil' do
    assert_equal [], Task.new.send(:get_hash_tags, nil)
  end

  test 'get_hash_tags to return hashtags from title string' do
    assert_equal ['#multiple', '#hashtags'], Task.new.send(:get_hash_tags, tasks(:three).title)
  end

  test 'get_hash_tags to return unique hashtags only from title string' do
    assert_equal ['#string', '#hashtags', '#repeating'], Task.new.send(:get_hash_tags, tasks(:four).title)
  end
end
