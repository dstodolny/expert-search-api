class AddShortUrlToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :short_url, :string
  end
end
