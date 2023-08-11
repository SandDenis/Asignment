class Food < ApplicationRecord

  validates :name,
            presence: true,
            length: {
              minimum: 3,
              too_short: 'to_short'
            }

  validates :foodometer,
            presence: true
end