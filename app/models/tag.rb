# frozen_string_literal: true

# Tag model to include tag related methods
class Tag < ApplicationRecord
  # many-to-many association is used below
  has_many :tagged_tasks, dependent: :destroy
  has_many :tasks, through: :tagged_tasks

  # validation for presence and uniqueness of name field in Tag Model
  validates :name, presence: true, uniqueness: true

  # scope to find the popularity of the tags
  scope :find_by_popularity, lambda {
    select('count(task_id) as task_id_count, name').joins(:tagged_tasks).group(:tag_id).order('task_id_count desc')
  }

  # method to get tag_id for given tag name
  def self.tag_id(name)
    Tag.where(name: name).pluck(:id)
  end
end
