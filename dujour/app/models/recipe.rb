class Recipe < ActiveRecord::Base

  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments
  accepts_nested_attributes_for :ingredients
  validates :name, presence: true
  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  def ingredients_attributes=(ingredients_hash)
    # ingredients_hash={
    #   "0" => ["name" => "name input"]
    #   "1" => ["name" => "name input"]
    # }
    ingredients_hash.values.each do |ingredient_attributes|
      if ingredient_attributes[:name] != ""
        ingredient = Ingredient.find_or_create_by(name: ingredient_attributes[:name])
        self.ingredients << ingredient
      end
    end
  end

end
