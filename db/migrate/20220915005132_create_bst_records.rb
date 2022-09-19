class CreateBstRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :bst_records do |t|
      t.references :bst, null: false, foreign_key: true
      t.integer :year
      t.integer :month
      t.decimal :cash, precision: 19, scale: 3
      t.decimal :accounts_receivable, precision: 19, scale: 3
      t.decimal :ar_sales_ratio, precision: 6, scale: 3
      t.decimal :merchandise_other, precision: 19, scale: 3
      t.decimal :mo_sales_ratio, precision: 6, scale: 3
      t.decimal :land_buildings, precision: 19, scale: 3
      t.decimal :investment_other, precision: 19, scale: 3
      t.decimal :accounts_payable, precision: 19, scale: 3
      t.decimal :cost_ratio, precision: 6, scale: 3
      t.decimal :cd_other, precision: 19, scale: 3
      t.decimal :long_term_debt, precision: 19, scale: 3
      t.decimal :fl_other, precision: 19, scale: 3
      t.decimal :capital, precision: 19, scale: 3
      t.decimal :surplus, precision: 19, scale: 3

      t.timestamps
    end
  end
end
