class HardDrivesController < ApplicationController
  def index
    @hard_drives = HardDrive.all
  end

  def show
    @hard_drive = HardDrive.find(params[:id])
  end
end
