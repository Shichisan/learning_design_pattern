class ReportVisitor < Visitor
  @@total_income = 0
  @@total_expense = 0
  @@total_balance = 0

  def visit_detail(detail)
    amount = detail.amount

    if detail.detail_type == 'income'
      @@total_income += amount
      @@total_balance += amount
    else
      @@total_expense += amount
      @@total_balance -= amount
    end
  end

  def visit_group(group)
    results = {}
    children = group.get_child

    children.each do |key, value|
      hash = {}

      next if value.size.zero?
      value.each do |v|
        category = Category.find(v.category_id)

        hash[category.name.to_sym] = 0 if hash[category.name.to_sym].blank?
        hash[category.name.to_sym] += v.amount
      end

      results[key] = hash
    end

    results
  end

  def reset
    @@total_income = 0
    @@total_expense = 0
    @@total_balance = 0
  end

  def results
    return {
      total_income: @@total_income,
      total_expense: @@total_expense,
      total_balance: @@total_balance
    }
  end
end
