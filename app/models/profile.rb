class Profile < ActiveRecord::Base

  ## relations

  belongs_to :user

  ## callbacks

  before_save :check_and_update_level

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

  ## instance methods

  def xp_points_for_next_level
    Rules.xp_for_level(level)
  end

  def percentage_xp_to_next_level
    xp = (xp_points.to_f / Rules.xp_for_level(level).to_f) * 100
    return xp.to_i
  end

  def award_xp_for_task_completion xp
    # update profile
    self.xp_points += xp
    self.save!
  end

  def award_xp_for_task_creation
    self.xp_points += Rules.base_xp_bonus_for_task_creation
    self.save!
  end


  ## private

  def check_and_update_level
    if self.xp_points > Rules.xp_for_level(level)
      self.level += 1
    end
  end




end
