class Detail < ApplicationRecord
  validates :amount, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :detail_type, presence: true

  belongs_to :user
  belongs_to :category
end
