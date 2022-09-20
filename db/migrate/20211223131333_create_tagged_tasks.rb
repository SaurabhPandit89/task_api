# frozen_string_literal: true

# class to create migration for TaggedTasks table
class CreateTaggedTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tagged_tasks do |t|
      t.belongs_to :task
      t.belongs_to :tag

      t.timestamps
    end
  end
end
