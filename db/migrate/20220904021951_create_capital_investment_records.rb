class CreateCapitalInvestmentRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :capital_investment_records do |t|
      t.references :capital_investment, null: false, foreign_key: true
      t.integer :year
      t.integer :month
      t.decimal :existing_facilities, precision: 19, scale: 3
      t.decimal :new_facilities, precision: 19, scale: 3
      t.decimal :d_existing_facilities, precision: 19, scale: 3
      t.decimal :d_new_facilities, precision: 19, scale: 3
      t.integer :d_year

      t.timestamps
    end
  end
end
