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

  ## instance methods

  def complete!
    self.done = true
    save
  end

end
