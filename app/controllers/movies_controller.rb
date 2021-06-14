class MoviesController < ApplicationController
  PER_PAGE = 12
  def index
    @movies = Movie.includes(:watch_progresses).where(genre: Movie::RAILS_GENRE_LIST).filter_by(params[:genre]).page(params[:page]).per(PER_PAGE)
  end
end
