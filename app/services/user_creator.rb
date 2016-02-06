class UserCreator
  def initialize(params)
    @user = User.new(params)
  end

  def create
    if @user.url.present?
      @user.short_url = Bitly.client.shorten(@user.url).short_url
    end

    if @user.save
      HeaderCreator.new(@user).create
    end
  end

  def errors
    @user.errors.full_messages
  end
end
