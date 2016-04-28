class RecipeIngredient < ActiveRecord::Base

  belongs_to :ingredient
  belongs_to :recipe


  def self.setAmounts(recipe_id, ingredients_attributes)
    # ingredients_attributes={
    #   "0" => ["name" => "name input", "amount" => "amount input"]
    #   "1" => ["name" => "name input", "amount" => "amount input"]
    # }
    recipe_ingredients = self.where(recipe_id: recipe_id)
    ingredients_attributes.values.each do |ingredient_attributes|
      ingredient_attributes.values.each do |individual_attributes|
        if individual_attributes[:name] != ""
          ingredient = Ingredient.find_by(name: individual_attributes[:name])
          join_row = recipe_ingredients.find_by(ingredient_id: ingredient.id)
          join_row.amount = individual_attributes[:amount]
          join_row.save
        end
      end
    end
  end

  def self.getAmount(recipe_id, ingredient_id)
    self.find_by(recipe_id:recipe_id, ingredient_id: ingredient_id).amount
  end

end
