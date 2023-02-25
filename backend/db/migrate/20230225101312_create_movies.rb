class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false, default: ''
      t.integer :length, null: false, default: 0
      t.string :imdb_id, null: false, default: ''
      t.text :description, null: false, default: ''
      t.string :release_date, null: false, default: ''
      t.integer :popularity, null: false, default: 0

      t.timestamps
    end
    add_index :movies, %i[title imdb_id], unique: true
    add_index :movies, %i[title release_date], unique: true
  end
end
