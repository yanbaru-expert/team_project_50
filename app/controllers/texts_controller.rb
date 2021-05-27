
class TextsController < ApplicationController
  def index
    # @texts = Text.all
    @texts = Text.where(genre: ["basic", "git", "ruby", "rails"])
  end

  def show
  end
end
