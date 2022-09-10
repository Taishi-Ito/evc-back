class Pl < ApplicationRecord
  belongs_to :project
  has_many :pl_record, dependent: :destroy
end
