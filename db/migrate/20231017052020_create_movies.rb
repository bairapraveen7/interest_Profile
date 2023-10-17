class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.text :name
      t.text :director

      t.timestamps
    end
  end
end
