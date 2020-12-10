class UsersController < ApplicationController
  def show
    @user = find_user

    return @user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: { status: 201, message: 'user was created' }
    else
      render json: { status: 500, message: 'something went wrong' }
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
