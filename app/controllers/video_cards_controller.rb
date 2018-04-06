class VideoCardsController < ApplicationController
  def index
    @video_cards = VideoCard.all
  end

  def show
    @video_card = VideoCard.find(params[:id])
  end
end
