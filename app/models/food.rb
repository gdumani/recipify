class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_and_belongs_to_many :recipes, through: :recipe_foods

  validates :name, presence: true, length: { maximum: 50 }
  validates :measurement_unit, presence: true, length: { maximum: 20 }
  validates :price , presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
