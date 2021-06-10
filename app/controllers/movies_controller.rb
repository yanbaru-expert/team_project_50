class MoviesController < ApplicationController
  def index
    @movies = Movie.where(genre: Movie::RAILS_GENRE_LIST).page(params[:page]).per(12)
    @movies = Movie.filter_by(params[:genre])
  end
end
