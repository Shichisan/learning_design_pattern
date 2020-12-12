class Detail < ApplicationRecord
  include ParticularComponent

  validates :amount, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :detail_type, presence: true

  belongs_to :user
  belongs_to :category
  belongs_to :group

  def add_to_group(group)
    self.group = group
    save
  end

  def remove_from_group
    self.group = nil
    save
  end
end
