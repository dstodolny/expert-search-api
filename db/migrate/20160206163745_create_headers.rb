class CreateHeaders < ActiveRecord::Migration[5.0]
  def change
    create_table :headers do |t|
      t.references :user, foreign_key: true
      t.integer :importance
      t.text :content

      t.timestamps
    end
  end
end
