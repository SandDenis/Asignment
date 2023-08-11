class Pet < ApplicationRecord

  belongs_to :user
  has_many :toys

  validates :name,
            presence: true,
            length: {
              minimum: 3,
              too_short: 'to_short'
            }

  validates :breed,
            presence: true,
            length: {
              minimum: 3,
              too_short: 'to_short'
            }

  validates :health,
            presence: true

  validates :happiness,
            presence: true,
            numericality: { less_than_or_equal_to: 100, greater_than_or_equal_to: 0,  only_integer: true }

  validates :hunger,
            presence: true,
            numericality: { less_than_or_equal_to: 100, greater_than_or_equal_to: 0, only_integer: true }

  def play (value)
    unless self.hunger > 80
      self.update(happiness: self.happiness + value, hunger: self.hunger + 20)
      return true
    end
    false
  end

  def feed (value)
    if self.hunger != 0 || self.health != 100
      self.update(hunger: self.hunger - value, health: 100)
      return true
    end
    false
  end

end