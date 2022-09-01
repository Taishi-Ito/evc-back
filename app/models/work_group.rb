class WorkGroup < ApplicationRecord
  belongs_to :user
  has_many :projects, dependent: :destroy
  validates :title, presence: true
end
