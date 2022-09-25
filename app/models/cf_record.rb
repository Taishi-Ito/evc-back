class CfRecord < ApplicationRecord
  belongs_to :cf
  validates :year, numericality: true, presence: true
  validates :month, numericality: true, allow_nil: true
  validates :payout_ratio, numericality: true, presence: true
  validates :dividend, numericality: true, presence: true
end
