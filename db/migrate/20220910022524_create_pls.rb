class CreatePls < ActiveRecord::Migration[6.1]
  def change
    create_table :pls do |t|
      t.references :project, null: false, foreign_key: true
      t.text :sequence
      t.string :title
      t.string :unit
      t.integer :fixed
      t.string :created_by
      t.string :edited_by

      t.timestamps
    end
  end
end
