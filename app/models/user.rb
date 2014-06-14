class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## relations

  has_many :tasks
  has_one :profile


  ## instance methods

  def number_of_open_tasks
    return tasks.not_done.size
  end

  def number_of_completed_tasks
    return tasks.completed.size
  end

end
