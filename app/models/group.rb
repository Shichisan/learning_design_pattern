class Group < ApplicationRecord
  include ParticularComponent

  validates :name, presence: true

  has_many :details, dependent: :destroy

  def add_item(item)
    if item.class == Detail
      item.add_item(self)
    elsif item.class == Group
      item.update(parent_group_id: self.id)
    end
  end

  def remove_item(item)
    if item.class == Detail
      item.remove_item
    elsif item.class == Group
      item.update(parent_group_id: parent_group_id)
    end
  end


    end

  def get_child
    children = {}
    children[:details] = details
    children
  end

  def is_most_parent?
    parent_group_id == nil
  end
end
