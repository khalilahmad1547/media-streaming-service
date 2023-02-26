class Api::V0::GenreController < ApplicationController
  def index
    render json: Genre.all, serialize_each: Api::V0::GenreSerializer
  end

  def create
    genre = Genre.new genre_params
    if genre.save
      render json: genre, serializer: Api::V0::GenreSerializer, status: :created
    else
      render json: { errors: genre.errors.messages }
    end
  end

  def show
    render json: Genre.find(params[:id]), serializer: Api::V0::GenreSerializer
  end

  def destroy
    genre = Genre.find(params[:id])
    if genre.destroy
      render json: genre, serializer: Api::V0::GenreSerializer, status: :ok
    else
      render json: { message: "Can't delete Genre", errors: genre.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def genre_params
    params.permit(:name)
  end
end
