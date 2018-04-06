class CpuCoolersController < ApplicationController
  def index
    @cpu_coolers = CpuCooler.all
  end

  def show
    @cpu_cooler = CpuCooler.find(params[:id])
  end
end
