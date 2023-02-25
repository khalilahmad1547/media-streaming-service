FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    length { 60 }
    imdb_id { 'MyString' }
    description { 'MyText' }
    release_date { Faker::Date.forward.strftime('%Y-%m-%d') }
    popularity { 5 }
    vedio_file { nil }
    subtitle_file { nil }
    trailer_file { nil }
    thumbnail_file { nil }
  end
end
