class UsersController < ApplicationController
  def show
    @user = find_user

    render json: @user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: { message: 'user was created' }, status: :created
    else
      render json: { message: 'something went wrong' }, status: :internal
    end
  end

  def update
    @user = find_user
    @user.update(user_params)
  end

  def destroy
    @user = find_user
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :gender,
      :prefecture,
      :occupation,
      :min_annual_income,
      :max_annual_income
    )
  end

  def find_user
    User.find(params[:id])
  end
end
