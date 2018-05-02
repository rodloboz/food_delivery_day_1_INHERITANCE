require_relative '../views/meals_view'

class MealsController
  def initialize(meals_repository)
    @meals_repository = meals_repository
    @view = MealsView.new
  end

  def list
    meals = @meals_repository.all
    @view.display(meals)
  end

  def add
    name = @view.ask_for(:name)
    price = @view.ask_for(:price).to_i
    meal = Meal.new(name: name, price: price)
    @meals_repository.add(meal)
  end
end
