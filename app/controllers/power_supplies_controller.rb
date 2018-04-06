class PowerSuppliesController < ApplicationController
  def index
    @power_supplys = PowerSupply.all
  end

  def show
    @power_supply = PowerSupply.find(params[:id])
  end
end
