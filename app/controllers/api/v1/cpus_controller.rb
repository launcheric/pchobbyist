class Api::V1::CpusController < ApplicationController
  def index
    render json: Cpu.all
  end
end
