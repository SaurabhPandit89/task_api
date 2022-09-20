# frozen_string_literal: true

# TaggedTask model to be used as intermediate model for many-to-many relation between Task & Tag models
class TaggedTask < ApplicationRecord
  # many-to-many association is used below
  belongs_to :task
  belongs_to :tag

  # validates presence of task_id & tag_id in TaggedTask model
  validates_presence_of :task_id, :tag_id
  validates_uniqueness_of :task_id, scope: :tag_id
end
