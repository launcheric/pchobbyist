class Api::V1::HardDrivesController < ApplicationController
  def index
    render json: HardDrive.all
  end
end
