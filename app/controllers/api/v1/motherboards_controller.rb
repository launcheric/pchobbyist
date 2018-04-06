class Api::V1::MotherboardsController < ApplicationController
  def show
    cpu = Cpu.find(params[:id])
    cpu_socket = cpu.socket
    motherboard_list = []
    Motherboard.all.each do |motherboard|
      motherboard_list.push(motherboard) if motherboard.socket == cpu_socket
    end
    render json: motherboard_list
  end
end
