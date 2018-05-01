# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative 'app/models/meal'
require_relative 'app/models/customer'
require_relative 'app/repositories/base_repository'
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'app/views/meals_views'
require_relative 'app/views/customers_views'
require_relative 'router'
require 'csv'


meals_csv_file = 'meals.csv'
customers_csv_file = 'customers.csv'

# Create repos
meals_repository = MealRepository.new(meals_csv_file)
customers_repository = CustomerRepository.new(customers_csv_file)

# Create controllers
meals_controller = MealsController.new(meals_repository)
customers_controller = CustomersController.new(customers_repository)
controllers = {
  meals_controller: meals_controller,
  customers_controller: customers_controller
}

# Create router
router = Router.new(controllers)

# Start the app
router.run
