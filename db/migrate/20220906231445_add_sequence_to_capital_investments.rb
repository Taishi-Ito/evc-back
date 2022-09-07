class AddSequenceToCapitalInvestments < ActiveRecord::Migration[6.1]
  def change
    add_column :capital_investments, :sequence, :text
  end
end
