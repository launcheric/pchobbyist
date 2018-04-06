class Api::V1::PowerSuppliesController < ApplicationController
  def index
    render json: PowerSupply.all
  end
end
