module ParticularComponent
  extend ActiveSupport::Concern

  def add_item
  end

  def remove_item
  end

  def get_child
  end

  def accept
    raise NotImplementedError, "#{self.class} should be implemented #{__method__}"
  end
end
