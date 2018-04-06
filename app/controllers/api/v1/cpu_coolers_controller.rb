class Api::V1::CpuCoolersController < ApplicationController
  def index
    render json: CpuCooler.all
  end
end
