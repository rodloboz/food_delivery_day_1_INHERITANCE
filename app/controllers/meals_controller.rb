require_relative '../views/meals_views'

class MealsController
  def initialize(meals_repository)
    @meals_repository = meals_repository
    @view = MealsViews.new
  end

  def list
    meals = @meals_repository.all
    @view.meals(meals)
  end

  def add
    name = @view.ask_name
    price = @view.ask_price
    meal = Meal.new(name: name, price: price)
    @meals_repository.add(meal)
  end
end
