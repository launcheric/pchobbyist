class UsersController < ApplicationController
  def index
  end
  def show
    @builds = current_user.builds
  end
end
