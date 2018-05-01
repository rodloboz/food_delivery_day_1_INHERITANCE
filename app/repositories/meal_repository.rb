class MealRepository < BaseRepository

  private

  def build_element(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    Meal.new(row)
  end
end
