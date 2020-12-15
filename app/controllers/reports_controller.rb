class ReportsController < ApplicationController
  def show
    results = {}

    report_visitor = ReportVisitor.new

    details = Detail.where(user_id: report_params[:user_id])
    details.each do |d|
      d.accept(report_visitor)
    end
    results = report_visitor.results

    most_parent_groups = Group.where(parent_group_id: nil)
    most_parent_groups.each do |g|
      result = g.accept(report_visitor)
      p "result: #{result.class}"
      results.merge!(result)
    end

    report_visitor.reset

    render json: results, status: :ok
  end

  private

  def report_params
    params.require(:report).permit(:user_id)
  end
end
