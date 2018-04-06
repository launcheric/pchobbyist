class Api::V1::BuildsController < ApplicationController
  def index
    all_builds = []
    Build.all.order('id DESC').map do |build|
      video_card = ''
      if build.cpu.integrated_graphics
        video_card = build.cpu.integrated_graphics
      else
        video_card = build.video_card
      end
      build_detail = {
        build: build,
        cpu: build.cpu.name,
        video_card: video_card
      }
      all_builds << build_detail
    end
    render json: { builds: all_builds, user: current_user }
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
