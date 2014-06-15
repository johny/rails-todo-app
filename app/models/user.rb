class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## relations

  has_many :tasks
  has_one :profile, dependent: :destroy

  validates :name, presence: true, length: {
    maximum: 250,
    too_long: "Maksymalnie 250 znaków!"
  }

  after_create do
    if profile.nil?
      profile = Profile.initialize_profile_for!(self)
    end
  end


  ## instance methods

  def number_of_open_tasks
    return tasks.not_done.size
  end

  def number_of_completed_tasks
    return tasks.completed.size
  end

  def recalculate_xp!

    profile.xp_points = tasks.completed.sum(:xp_points)
    profile.save

  end

end
