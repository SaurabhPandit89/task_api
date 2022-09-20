# frozen_string_literal: true

# class to create migration for Tasks table
class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title

      t.timestamps
    end
  end
end
