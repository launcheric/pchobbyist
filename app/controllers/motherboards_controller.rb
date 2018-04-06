class MotherboardsController < ApplicationController
  def index
    @motherboards = Motherboard.all
  end

  def show
    @motherboard = Motherboard.find(params[:id])
  end
end
