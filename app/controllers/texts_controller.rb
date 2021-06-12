class TextsController < ApplicationController
  def index
    @texts = Text.filter_by(params[:genre])
  end

  def show
    @text = Text.find(params[:id])
  end
end
