class Movie < ApplicationRecord
  has_one_attached :vedio_file
  has_one_attached :subtitle_file
  has_one_attached :trailer_file
  has_one_attached :thumbnail_file

  has_many :movie_genres, dependent: :destroy
  has_many :genres, through: :movie_genres

  validates_presence_of :title
  validates_uniqueness_of :title, scope: :imdb_id, case_sensitive: false, message: '%<value>s already exist'
  validates_numericality_of :length, greater_than: 0
  validates_numericality_of :popularity, greater_than: 0, less_than_or_equal_to: 10
  validates_length_of :release_date, is: 10
end
