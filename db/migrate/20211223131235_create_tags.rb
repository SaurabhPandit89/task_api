# frozen_string_literal: true

# class to create migration for Tags table
class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
