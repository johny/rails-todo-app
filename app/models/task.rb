class Task < ActiveRecord::Base

  ## relations

  belongs_to :user

  ## validations

  validates :title, presence: true, length: {
    maximum: 250,
    too_long: "Maksymalnie 250 znaków!"
  }

  ## callbacks

  before_create :set_xp_for_task

  ## scopes

  scope :not_done, -> {where(done: false).order(created_at: :desc)}
  scope :finished, -> {where(done: true).order(completed_at: :desc, created_at: :desc)}
  scope :completed, -> {finished}

  ## instance methods

  def complete!
    if done == false
      self.done = true
      self.completed_at = Time.now
      self.user.profile.award_xp_for_task_completion self.xp_points
      save
    end
  end

  ## private methods

  private

    def set_xp_for_task
      # get base value
      xp = Rules.base_xp_bonus_for_task_completion
      xp = (xp * rand(80..120) / 100).to_i
      self.xp_points = xp
    end

end
