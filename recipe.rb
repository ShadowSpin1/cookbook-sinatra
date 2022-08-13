class Recipe
  attr_accessor :name, :description, :rating, :prep_time, :done

  def initialize(attribute = {})
    @name = attribute[:name]
    @description = attribute[:description]
    @rating = attribute[:rating]
    @prep_time = attribute[:prep_time]
    @done = attribute[:done]
  end

  def done?
    @done == true ? "X" : ""
  end
end
