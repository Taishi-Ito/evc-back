class CapitalInvestmentRecord < ApplicationRecord
  belongs_to :capital_investment
  validates :year, numericality: true, presence: true
  validates :month, numericality: true, allow_nil: true
  validates :existing_facilities, numericality: true, presence: true
  validates :new_facilities, numericality: true, presence: true
  validates :d_existing_facilities, numericality: true, presence: true
  validates :d_new_facilities, numericality: true, presence: true
  validates :d_year, numericality: true, presence: true
end
