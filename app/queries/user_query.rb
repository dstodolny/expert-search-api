class UserQuery
  def initialize(params)
    @params = params
  end

  def query
    user_id = @params[:user_id]

    friends_ids = User.find(user_id).friends.pluck(:id)
    friends_ids << user_id.to_i

    dataset = User.where("id NOT IN (?)", friends_ids)

    if @params[:q].present?
      query = "#{@params[:q].downcase}%"
      dataset = dataset.where("LOWER(name) LIKE ?", query)
    end

    dataset.limit(5)
  end
end
