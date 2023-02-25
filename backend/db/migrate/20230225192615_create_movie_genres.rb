class CreateMovieGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_genres do |t|
      t.belongs_to :movie, forgin_key: true
      t.belongs_to :genre, forgin_key: true
      t.timestamps
    end
    add_index :movie_genres, %i[movie_id genre_id], unique: true
  end
end
