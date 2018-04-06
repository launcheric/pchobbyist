class Api::V1::NetworkCardsController < ApplicationController
  def index
    render json: NetworkCard.all
  end
end
