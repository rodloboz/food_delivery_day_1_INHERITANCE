require_relative 'base_view'

class CustomersView < BaseView
  def display(customers)
    customers.each do |customer|
      puts "#{customer.id} - Name: #{customer.name}, Address: #{customer.address}"
    end
  end
end
