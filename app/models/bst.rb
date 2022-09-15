class Bst < ApplicationRecord
  belongs_to :project
  # has_many :bst_record, dependent: :destroy
  serialize :sequence
  validates :unit, presence: true
  validates :fixed, presence: true
end
