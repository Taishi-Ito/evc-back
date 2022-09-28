class User < ApplicationRecord
  has_many :work_groups, dependent: :destroy
  validates :uid, presence: true
  validates :name, presence: true
  validates :locale, presence: true

  def self.current_user uid
    User.find_by(uid: uid)
  end
end
