require_relative '../views/customers_view'

class CustomersController
  def initialize(customers_repository)
    @customers_repository = customers_repository
    @view = CustomersView.new
  end

  def list
    customers = @customers_repository.all
    @view.customers(customers)
  end

  def add
    name = @view.ask_name
    address = @view.ask_address
    customer = Customer.new(name: name, address: address)
    @customers_repository.add(customer)
  end
end
