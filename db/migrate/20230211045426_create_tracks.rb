class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.string :code
      t.integer :status
      t.references :branch, null: false, foreign_key: true
      t.references :assigned, null: false
      t.references :owner, null: false

      t.timestamps
    end
  end
end
