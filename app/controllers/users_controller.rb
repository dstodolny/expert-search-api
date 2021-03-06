class UsersController < ApplicationController
  expose(:users)
  expose(:user, attributes: :user_params)

  def index
    if params[:for_select].present?
      render json: ::Users::SelectQuery.new(params).query
    elsif params[:for_path].present?
      render json: ::Users::PathQuery.new(params).query
    else
      render json: users
    end
  end

  def show
    render json: user
  end

  def create
    user_service = UserCreator.new(user_params)
    if user_service.create
      render json: user_service.user, status: :created
    else
      render json: { errors: user_service.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:data)
          .require(:attributes)
          .permit(:name, :url)
  end
end
