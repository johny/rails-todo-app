class Profile < ActiveRecord::Base

  ## relations

  belongs_to :user


  ## class methods

  def self.initialize_profile_for! user
    @profile = Profile.new
    @profile.user = user
    @profile.title = Profile.title_for_level 1
    @profile.save!
  end

  def self.title_for_level lvl
    case lvl
    when 1
      "Początkujący Praktykant"
    when 10
      "Cierpliwy Czeladnik"
    when 20
      "Ambitny Adept"
    when 30
      "Wybitny Wyrobnik"
    when 40
      "Uczciwy Uczeń"
    when 100
      "Mądry Mistrz"
    else
      nil
    end
  end

end
