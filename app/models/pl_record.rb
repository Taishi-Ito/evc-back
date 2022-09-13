class PlRecord < ApplicationRecord
  belongs_to :pl
  validates :year, numericality: true, presence: true
  validates :month, numericality: true, allow_nil: true
  validates :customer, numericality: true, presence: true
  validates :av_customer_spend, numericality: true, presence: true
  validates :sales_cost, numericality: true, presence: true
  validates :sales_cost_ratio, numericality: true, presence: true
  validates :labor_cost, numericality: true, presence: true
  validates :cost_other, numericality: true, presence: true
  validates :no_op_income, numericality: true, presence: true
  validates :interest_expense, numericality: true, presence: true
  validates :interest_rate, numericality: true, presence: true
  validates :other, numericality: true, presence: true
  validates :tax, numericality: true, presence: true
  validates :tax_rate, numericality: true, presence: true
end
