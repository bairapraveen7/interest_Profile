class CreateUserSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :user_songs do |t|
      t.integer :status
      t.integer :rating
      t.text :review
      t.references :user, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true

      t.timestamps
    end
  end
end
