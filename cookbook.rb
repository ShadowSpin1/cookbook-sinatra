require "csv"

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @filepath = csv_file_path
    CSV.foreach(csv_file_path) do |row|
      recipe = Recipe.new(name: row[0], description: row[1], rating: row[2], prep_time: row[3])
      @recipes << recipe
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    update(@recipes)
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    update(@recipes)
  end

  private

  def update(recipes)
    CSV.open(@filepath, "wb") do |csv|
      recipes.each { |recipe| csv << [recipe.name, recipe.description, recipe.rating, recipe.prep_time] }
    end
  end
end
