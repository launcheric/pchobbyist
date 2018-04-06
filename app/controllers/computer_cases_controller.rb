class ComputerCasesController < ApplicationController
  def index
    @computer_cases = ComputerCase.all
  end

  def show
    @computer_case = ComputerCase.find(params[:id])
  end
end
