class Api::V1::MemoryCardsController < ApplicationController
  def show
    motherboard = Motherboard.find(params[:id])
    memory_type = motherboard.memory_type[0, 4]
    memory_card_list = []
    MemoryCard.all.each do |memory_card|
      if memory_card.speed[0, 4] == memory_type
        memory_card_list.push(memory_card)
      end
    end
    render json: memory_card_list
  end
end
