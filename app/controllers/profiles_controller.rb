class ProfilesController < ApplicationController

  before_filter :authenticate_user!

  def show
    @profile = current_user.profile
  end

end
