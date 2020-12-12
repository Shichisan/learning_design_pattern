class Group < ApplicationRecord
  include ParticularComponent

  validates :name, presence: true

  has_many :details, dependent: :destroy

  def add_item(item, parent_id = nil)
    if item.class == Detail
      item.add_item(self)
    elsif item.class == Group
      return if parent_id.blank?

      update(parent_group_id: parent_id)
    end
  end

  def remove_item(item)
    if item.class == Detail
      item.remove_item
    elsif item.class == Group
      if is_most_parent?
        item.parent_group_id = nil
        item.save

        return
      end

      item.parent_group_id = parent_group_id
      item.save
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
