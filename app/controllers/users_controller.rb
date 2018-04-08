class UsersController < ApplicationController
  def index
  end
  def show
    @builds = current_user.builds
  end
  def destroy
    binding.pry
  end
end
