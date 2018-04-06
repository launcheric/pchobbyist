class NetworkCardsController < ApplicationController
  def index
    @network_cards = NetworkCard.all
  end

  def show
    @network_card = NetworkCard.find(params[:id])
  end
end
