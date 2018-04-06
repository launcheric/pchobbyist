class Api::V1::VideoCardsController < ApplicationController
  def index
    render json: VideoCard.all
  end
end
