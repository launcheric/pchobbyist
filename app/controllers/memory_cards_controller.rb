class MemoryCardsController < ApplicationController
  def index
    @memory_cards = MemoryCard.all
  end

  def show
    @memory_card = MemoryCard.find(params[:id])
  end
end
