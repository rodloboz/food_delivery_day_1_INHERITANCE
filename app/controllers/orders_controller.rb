require_relative '../views/orders_view'
require_relative '../views/meals_view'
require_relative '../views/customers_view'
require_relative '../views/employees_view'

class OrdersController
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @order_repository = order_repository
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @employees_view = EmployeesView.new
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @orders_view.display(orders)
  end

  def add
    @meals_view.display(@meal_repository.all)
    meal_id = @orders_view.ask_for("meal id").to_i

    @customers_view.display(@customer_repository.all)
    customer_id = @orders_view.ask_for("customer id").to_i

    @employees_view.display(@employee_repository.all_delivery_guys)
    employee_id = @orders_view.ask_for("employee id").to_i

    order = Order.new({
      meal: @meal_repository.find(meal_id),
      customer: @customer_repository.find(customer_id),
      employee: @employee_repository.find(employee_id)
      })

    @order_repository.add(order)
  end

  def list_my_orders(employee)
    orders = @order_repository.undelivered_orders.select do |order|
      order.employee == employee
    end
    @orders_view.display(orders)
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    order_id = @orders_view.ask_for("order id").to_i
    order = @order_repository.find(order_id)
    order.deliver!
    @order_repository.save
  end
end
