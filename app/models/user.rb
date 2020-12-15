class User < ApplicationRecord
  validates :name, presence: true
  validates :gender, presence: true

  has_many :details
  has_many :groups
end
