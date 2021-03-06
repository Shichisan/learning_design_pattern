class GroupsController < ApplicationController
  def index
    @groups = Group.all

    render json: @groups, status: :ok
  end

  def index_with_details
    group = find_group
    @results = group.get_child

    render json: @results, status: :ok
  end

  def create
    group = Group.new(group_params)
    if group.save
      render json: group, status: :created
    else
      render json: { message: 'something went wrong' }, status: :internal
    end
  end

  def update
    @group = find_group
    @group.update(group_params)

    head :ok
  end

  def destroy
    @group = find_group
    @group.destroy

    head :no_content
  end

  def add_to_group
    parent_group = Group.find(group_params[:parent_group_id])
    group = find_group
    parent_group.add_item(group)

    render json: group, status: :ok
  end

  def remove_from_group
    parent_group = Group.find(group_params[:parent_group_id])
    group = find_group
    parent_group.remove_item(group)

    render json: group, status: :ok
  end

  private

  def group_params
    params.require(:group).permit(:name, :parent_group_id)
  end

  def find_group
    Group.find(params[:id])
  end
end
