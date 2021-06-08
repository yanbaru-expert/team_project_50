class MoviesController < ApplicationController
  def index
    @movies = Movie.filter_by(params[:genre])
  end
end
