class UserCreator
  def initialize(params)
    @user = User.new(params)
  end

  def create
    if @user.save
      HeaderCreator.new(@user).create
    end
  end

  def errors
    @user.errors.full_messages
  end
end
