class Api::V1::User < ApplicationRecord
  has_many :api_v1_work_groups, dependent: :destroy
  validates :uid, presence: true
  validates :name, presence: true
  validates :locale, presence: true
end
