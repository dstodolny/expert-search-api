class FriendshipsController < ApplicationController
  expose(:friendships)
  expose(:friendship, attributes: :friendship_params)

  def index
    render json: friendships
  end

  def show
    render json: friendship
  end

  def create
    if friendship.save
      render json: friendship, status: :created
    else
      render json: { errors: friendship.errors }, status: :unprocessable_entity
    end
  end

  private

  def friendship_params
    params.require(:data)
          .require(:attributes)
          .permit(:user_id, :friend_id)
  end
end
