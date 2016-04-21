class Ingredient < ActiveRecord::Base

  has_many :recipes, through: :recipe_ingredients
  attr_accessor :amount

  def initialize()
    #FIND OR CREATE BY
  end
  
  def amount=()
    #access join table, find correct row, add amount
  end

  def amount
    #access join table, find correct row, return amount
  end

end
