class Group < ApplicationRecord
  validates :name, presence: true

  has_many :details, dependent: :destroy
end
