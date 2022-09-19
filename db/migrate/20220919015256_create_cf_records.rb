class CreateCfRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :cf_records do |t|
      t.references :cf, null: false, foreign_key: true
      t.integer :year
      t.integer :month

      t.timestamps
    end
  end
end
