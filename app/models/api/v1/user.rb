class Api::V1::User < ApplicationRecord
  has_many :api_v1_work_groups, dependent: :destroy, :class_name => 'Api::V1::WorkGroup', foreign_key: :api_v1_user_id
  validates :uid, presence: true
  validates :name, presence: true
  validates :locale, presence: true
end
