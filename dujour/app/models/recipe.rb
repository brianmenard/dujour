class Recipe < ActiveRecord::Base

  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  #accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(ingredients_hash)
    # ingredients_hash={
    #   "0" => ["name" => "name input"]
    #   "1" => ["name" => "name input"]
    # }
    ingredients_hash.values.each do |ingredient_attributes|
      ingredient = Ingredient.find_or_create_by(name: ingredient_attributes[:name])
      self.ingredients << ingredient 
      #need to figure out how to access amount!!!!
      #RecipeIngredient.create(recipe_id: self.id, ingredient_id: ingredient.id, amount: "TEST")
    end
  end

end
