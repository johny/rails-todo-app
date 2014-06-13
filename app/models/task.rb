class Task < ActiveRecord::Base

  belongs_to :user

  scope :not_done, -> {where(done: false).order(created_at: :desc)}
  scope :finished, -> {where(done: true).order(updated_at: :desc)}

  def complete!
    self.done = true
    save
  end

end
