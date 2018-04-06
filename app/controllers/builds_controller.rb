class BuildsController < ApplicationController
  def index
  end

  def show
    @build = Build.find(params[:id])
  end

  def update
    build = Build.find(params[:id])
    build.image_url = build_params[:image_url]
    if build.save!
      redirect_to "/builds/#{params[:id]}", notice: 'Your build image was successfully uploaded!'
    else
      redirect_to "/builds/#{params[:id]}", notice: "Your build image wasn't uploaded, please try again!"
    end
  end

  private

  def build_params
    params.require(:build).permit(:image_url)
  end
end
