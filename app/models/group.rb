class Group < ApplicationRecord
  include ParticularComponent

  validates :name, presence: true
  validates :user_id, presence: true

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

  def get_child(results = {})
    results[name.to_sym] = details

    children_groups = Group.where(parent_group_id: id)
    return results if children_groups.size.zero?

    children_groups.each do |group|
      group.get_child(results)
    end

    results
  end

  def accept(visitor)
    visitor.visit_group(self)
  end
end
