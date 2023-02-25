# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_225_200_900) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'genres', force: :cascade do |t|
    t.string 'name', default: '', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_genres_on_name', unique: true
  end

  create_table 'movie_genres', force: :cascade do |t|
    t.bigint 'movie_id'
    t.bigint 'genre_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['genre_id'], name: 'index_movie_genres_on_genre_id'
    t.index %w[movie_id genre_id], name: 'index_movie_genres_on_movie_id_and_genre_id', unique: true
    t.index ['movie_id'], name: 'index_movie_genres_on_movie_id'
  end

  create_table 'movies', force: :cascade do |t|
    t.string 'title', default: '', null: false
    t.integer 'length', default: 0, null: false
    t.string 'imdb_id', default: '', null: false
    t.text 'description', default: '', null: false
    t.string 'release_date', default: '', null: false
    t.integer 'popularity', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[title imdb_id], name: 'index_movies_on_title_and_imdb_id', unique: true
    t.index %w[title release_date], name: 'index_movies_on_title_and_release_date', unique: true
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name', default: '', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_roles_on_name', unique: true
  end

  create_table 'uploads', force: :cascade do |t|
    t.bigint 'movie_id'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['movie_id'], name: 'index_uploads_on_movie_id'
    t.index ['user_id'], name: 'index_uploads_on_user_id'
  end

  create_table 'user_roles', force: :cascade do |t|
    t.bigint 'role_id'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[role_id user_id], name: 'index_user_roles_on_role_id_and_user_id', unique: true
    t.index ['role_id'], name: 'index_user_roles_on_role_id'
    t.index ['user_id'], name: 'index_user_roles_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name', default: '', null: false
    t.string 'last_name', default: '', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'jti', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['jti'], name: 'index_users_on_jti', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
end
