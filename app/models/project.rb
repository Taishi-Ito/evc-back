class Project < ApplicationRecord
  belongs_to :work_group
  validates :title, presence: true
end
