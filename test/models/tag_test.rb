# frozen_string_literal: true

require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # VALIDATE PRESENCE & UNIQUENESS -> tests to validate presence and uniqueness of tag name
  test 'should not create tag when name is not given' do
    assert_not tags(:no_name).save
  end

  test 'should create tag when tag name is given' do
    assert Tag.new(name: '#newTag').save
  end

  test 'should not create tag with same name' do
    assert_not tags(:one).save
  end

  # SELF.TAG_ID -> tests to test tag_id class method of Tag model
  test 'tag_id to return Tag ID for given tag name' do
    assert_equal 4, Tag.tag_id('#four')[0]
  end

  test 'tag_id to return nil if tag name doesn\'t match' do
    assert_nil Tag.tag_id('#noTagWithThisName')[0]
  end
end
