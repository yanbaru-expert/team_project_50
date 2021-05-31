class MoviesController < ApplicationController
  def index
    #@movies = Movie.all
    @movies = Movie.where(genre: ["basic", "git", "ruby", "rails"])
  end
end
