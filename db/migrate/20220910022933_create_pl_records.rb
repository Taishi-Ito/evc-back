class CreatePlRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :pl_records do |t|
      t.references :pl, null: false, foreign_key: true
      t.integer :year
      t.integer :month
      t.decimal :customer, precision: 19, scale: 3
      t.decimal :av_customer_spend, precision: 19, scale: 3
      t.decimal :sales_const, precision: 19, scale: 3
      t.decimal :sales_const_ratio, precision: 6, scale: 3
      t.decimal :labor_cost, precision: 19, scale: 3
      t.decimal :cost_other, precision: 19, scale: 3
      t.decimal :no_op_income, precision: 19, scale: 3
      t.decimal :interest_expense, precision: 19, scale: 3
      t.decimal :interest_rate, precision: 6, scale: 3
      t.decimal :other, precision: 19, scale: 3
      t.decimal :tax, precision: 19, scale: 3
      t.decimal :tax_rate, precision: 6, scale: 3

      t.timestamps
    end
  end
end
