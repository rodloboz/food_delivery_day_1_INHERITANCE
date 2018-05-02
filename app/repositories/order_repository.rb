class OrderRepository
  def initialize(csv_file, meal_repository, employee_repository, customer_repository)
    @csv_file = csv_file
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @orders = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @orders
  end

  def add(order)
    @order = order
    @order.id = @next_id
    @next_id += 1
    @orders << @order
    save_to_csv
  end

  def find(id)
    @orders.find { |order| order.id == id }
  end

  def undelivered_orders
    @orders.select { |order| !order.delivered? }
  end

  def save
    save_to_csv
  end

  private

  def build_order(row)
    # this method returns an order instance
    id = row[:id].to_i
    delivered = row[:delivered] == "true"
    meal = @meal_repository.find(row[:meal_id].to_i)
    customer = @customer_repository.find(row[:customer_id].to_i)
    employee = @employee_repository.find(row[:employee_id].to_i)
    Order.new({
      id: id,
      delivered: delivered,
      meal: meal,
      customer: customer,
      employee: employee
    })
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      @orders << build_order(row)
    end
    @next_id = @orders.empty? ? 1 : @orders.last.id + 1
  end

  def save_to_csv
    CSV.open(@csv_file, 'w') do |csv|
      csv << @orders.first.class.headers
      @orders.each do |order|
        csv << order.to_csv_row
      end
    end
  end
end
