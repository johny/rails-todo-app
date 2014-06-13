class ProfilesController < ApplicationController

  before_filter :authenticate_user!

  def show
    if current_user.profile.nil?
      @profile = Profile.initialize_profile_for!(current_user)
    else
      @profile = current_user.profile
    end
  end

end
