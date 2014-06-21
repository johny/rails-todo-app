class Project < ActiveRecord::Base


  ## relations

  belongs_to :user
  has_many :tasks

  ## validations

  validates :name, presence: true, length: {
    maximum: 250,
    too_long: "Maksymalnie 250 znaków!"
  }


end
