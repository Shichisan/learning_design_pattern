class Visitor
  def visit_detail(detail)
    raise NotImplementedError, "#{self.class} should be implemented #{__method__}"
  end

  def visit_group(group)
    raise NotImplementedError, "#{self.class} should be implemented #{__method__}"
  end
end
