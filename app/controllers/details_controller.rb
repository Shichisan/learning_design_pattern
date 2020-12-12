class DetailsController < ApplicationController
  def index
    @details = Detail.all

    render json: @details
  end

  def show
    @detail = find_detail

    render json: @detail
  end

  def create
    detail = Detail.new(detail_params)
    if detail.save
      render json: { message: 'detail was created'}, status: :created
    else
      render json: { message: 'something went wrong'}, status: :internal
    end
  end

  def update
    @detail = find_detail
    @detail.update(detail_params)

    head :ok
  end

  def destroy
    @detail = find_detail
    @detail.destroy

    head :no_content
  end

  private

  def detail_params
    params.require(:detail).permit(:amount, :category_id, :user_id, :detail_type, :group_id)
  end

  def find_detail
    Detail.find(params[:id])
  end
end
