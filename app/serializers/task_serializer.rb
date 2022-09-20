# frozen_string_literal: true

# Task serializer to enhance the JSON response
class TaskSerializer < ActiveModel::Serializer
  attributes :title

  has_many :tags
end
