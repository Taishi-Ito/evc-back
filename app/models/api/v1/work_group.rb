class Api::V1::WorkGroup < ApplicationRecord
  belongs_to :api_v1_user, :class_name => 'Api::V1::User'
  validates :title, presence: true
end
