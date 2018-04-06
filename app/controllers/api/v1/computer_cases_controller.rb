class Api::V1::ComputerCasesController < ApplicationController
  def index
    render json: ComputerCase.all
  end
end
