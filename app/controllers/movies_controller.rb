class MoviesController < ApplicationController
  def index
    @movies = Movie.where(genre: Movie::RAILS_GENRE_LIST).page(params[:page]).per(12)
  end
end
