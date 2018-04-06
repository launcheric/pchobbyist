class Api::V1::UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    b1 = Build.create!(
      user: current_user,
      name: params[:title],
      description: params[:description],
      computer_case_id: params[:computerCase],
      cpu_cooler_id: params[:cpuCooler],
      cpu_id: params[:cpu],
      motherboard_id: params[:motherboard],
      network_card_id: params[:networkCard],
      power_supply_id: params[:powerSupply],
      video_card_id: params[:videoCard],
      image_url: ''
    )
    MemoryCount.create!(
      memory_card_id: params[:memoryCard],
      build: b1
    )
    HdCount.create!(
      hard_drive_id: params[:hardDrive],
      build: b1
    )
  end
end
