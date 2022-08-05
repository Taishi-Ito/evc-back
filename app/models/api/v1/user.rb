class Api::V1::User < ApplicationRecord
  validates :uid, presence: true
  validates :name, presence: true
  validates :locale, presence: true
end
