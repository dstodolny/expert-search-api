class UsersController < ApplicationController
  expose(:users)
  expose(:user, attributes: :user_params)

  def index
    render json: users
  end

  def show
    render json: user
  end

  def create
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:data)
          .require(:attributes)
          .permit(:name, :url)
  end
end
