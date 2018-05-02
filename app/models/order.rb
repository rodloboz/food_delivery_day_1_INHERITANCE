class Order
  attr_reader :employee, :meal, :customer
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @meal = attributes[:meal] # a meal instance
    @customer = attributes[:customer] # a customer instance
    @employee = attributes[:employee] # an employee instance
    @delivered = attributes[:delivered] || false # bollean
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def self.headers
    %w(id delivered meal_id employee_id customer_id)
  end

  def to_csv_row
    [@id, @delivered, @meal.id, @employee.id, @customer.id]
  end
end




