class CreateCapitalInvestmentRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :capital_investment_records do |t|
      t.references :capital_investment, null: false, foreign_key: true
      t.integer :year
      t.integer :existing_facilities
      t.integer :new_facilities
      t.integer :d_existing_facilities
      t.integer :d_new_facilities
      t.integer :d_year

      t.timestamps
    end
  end
end
