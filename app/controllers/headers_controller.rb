class HeadersController < ApplicationController
  expose(:user_headers) { Header.all }
  expose(:user_header) { Header.find(params[:id]) }

  def index
    render json: user_headers
  end

  def show
    render json: user_header
  end
end
