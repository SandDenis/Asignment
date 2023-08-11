class Toy < ApplicationRecord
  belongs_to :pet

  validates :name,
            presence: true,
            length: {
              minimum: 3,
              too_short: 'to_short'
            }

  validates :happiness,
            presence: true
end