class CreateHighlights < ActiveRecord::Migration[7.0]
  def change
    create_table :highlights do |t|
      t.string :name
      t.string :color
      t.integer :position
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
