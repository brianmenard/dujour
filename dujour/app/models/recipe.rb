class Recipe < ActiveRecord::Base

  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :ingredients
  
end