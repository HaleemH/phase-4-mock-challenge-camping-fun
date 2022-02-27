class Camper < ApplicationRecord
  has_many :signups
  has_many :activities, through: :signups

  # validations
  validates :name, presence: true
  validates :age,
            numericality: {
              greater_than_or_equal_to: 8,
              less_than_or_equal_to: 18,
            }

  def self.campers_activites
    Camper.all.each { |c| puts c.activities }
  end
end
