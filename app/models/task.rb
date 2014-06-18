class Task < ActiveRecord::Base

  ## relations

  belongs_to :user

  ## validations

  validates :title, presence: true, length: {
    maximum: 250,
    too_long: "Maksymalnie 250 znaków!"
  }

  ## attributes

  monetize :amount_gold, as: "gold", numericality: { greater_than_or_equal_to: 0 }

  ## callbacks

  before_validation :setup_task, :on => :create

  ## scopes

  scope :not_done, -> {where(done: false).order(created_at: :desc)}
  scope :finished, -> {where(done: true).order(completed_at: :desc, created_at: :desc)}
  scope :completed, -> {finished}

  ## instance methods

  def complete!
    if done == false
      self.done = true
      self.completed_at = Time.now
      self.user.profile.award_bonus_for_task_completion self
      save
    end
  end

  def silver
    gold.cents % 100
  end

  ## private methods

  private

    def setup_task

      logger.debug "Testing callback!"

      # get base value to set xp
      xp = Rules.base_xp_bonus_for_task_completion
      xp = (xp * rand(80..120) / 100).to_i
      self.xp_points = xp

      # get base value to set gold
      gold = Rules.base_gold_per_level
      gold = gold * rand(75..125) / 100
      self.gold = gold

      puts "Putting gold! #{gold}!"
    end

end
