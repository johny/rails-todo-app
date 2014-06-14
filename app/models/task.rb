class Task < ActiveRecord::Base

  ## relations

  belongs_to :user

  ## validations

  validates :title, presence: true, length: {
    maximum: 250,
    too_long: "Maksymalnie 250 znaków!"
  }

  ## scopes

  scope :not_done, -> {where(done: false).order(created_at: :desc)}
  scope :finished, -> {where(done: true).order(updated_at: :desc)}
  scope :completed, -> {finished}

  ## instance methods

  def complete!
    if done == false
      self.done = true
      self.user.profile.award_xp_for_task_completion
      save
    end
  end

end
