# frozen_string_literal: true

# Task model to include task related methods
class Task < ApplicationRecord
  # many-to-many associations is used below
  has_many :tagged_tasks, dependent: :destroy
  has_many :tags, through: :tagged_tasks

  # callback to create associated model objects
  after_validation :create_tags
  before_save :build_tagged_tasks

  # validation for the input title field
  validates :title, presence: true

  # function to create tags
  def create_tags
    get_hash_tags(title).each do |tag|
      Tag.find_or_create_by!(name: tag)
    end
  end

  # function to build tagged task object
  def build_tagged_tasks
    tagged_tasks_array = []
    get_hash_tags(title).each do |tag|
      tagged_tasks_array << { tag_id: Tag.tag_id(tag)[0] }
    end
    tagged_tasks.build(tagged_tasks_array)
  end

  private

  # function to fetch hash_tags from title string
  def get_hash_tags(text)
    text.blank? ? [] : text.scan(/#\w+/).uniq
  end
end
