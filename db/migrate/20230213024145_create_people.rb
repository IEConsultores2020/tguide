# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :email
      t.string :name
      t.string :citizenship
      t.string :nid
      t.string :mobile
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
