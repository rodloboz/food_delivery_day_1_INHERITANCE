class MealsView
  def display(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} : #{meal.price}€"
    end
  end

  def ask_name
    puts "What is the name of the meal?"
    gets.chomp.capitalize
  end

  def ask_price
    puts "What is the price of the meal?"
    gets.chomp.to_i
  end
end
