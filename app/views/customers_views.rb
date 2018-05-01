class CustomersViews
  def customers(customers)
    customers.each do |customer|
      puts "#{customer.id} - Name: #{customer.name}, Address: #{customer.address}"
    end
  end

  def ask_name
    puts "What is the customer's name?"
    gets.chomp
  end

  def ask_address
    puts "What is the customer's address?"
    gets.chomp
  end
end
