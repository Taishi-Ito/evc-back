class CreateCapitalInvestments < ActiveRecord::Migration[6.1]
  def change
    create_table :capital_investments do |t|
      t.references :project, null: false, foreign_key: true
      t.string :title
      t.string :unit
      t.integer :fixed
      t.string :created_by
      t.string :edited_by

      t.timestamps
    end
  end
end
