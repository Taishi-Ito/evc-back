class BstRecord < ApplicationRecord
  belongs_to :bst
  validates :year, numericality: true, presence: true
  validates :month, numericality: true, allow_nil: true
  validates :cash, numericality: true, presence: true
  validates :accounts_receivable, numericality: true, presence: true
  validates :ar_sales_ratio, numericality: true, presence: true
  validates :merchandise_other, numericality: true, presence: true
  validates :mo_sales_ratio, numericality: true, presence: true
  validates :investment_other, numericality: true, presence: true
  validates :accounts_payable, numericality: true, presence: true
  validates :cost_ratio, numericality: true, presence: true
  validates :cd_other, numericality: true, presence: true
  validates :long_term_debt, numericality: true, presence: true
  validates :fl_other, numericality: true, presence: true
  validates :capital, numericality: true, presence: true
end
