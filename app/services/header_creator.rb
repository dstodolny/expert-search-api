class HeaderCreator
  def initialize(user)
    @user = user
    @url = @user.url
  end

  def create
    scraped_headers.each do |header|
      Header.create(
        user: @user,
        importance: header.name,
        content: header.text
      )
    end
  end

  private

  def scraped_headers
    mechanize = Mechanize.new
    page = mechanize.get(@url)
    page.search("//h1|//h2|//h3")
  end
end
