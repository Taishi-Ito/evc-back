class CapitalInvestment < ApplicationRecord
  has_many :capital_investment_record, dependent: :destroy
  belongs_to :project
end
