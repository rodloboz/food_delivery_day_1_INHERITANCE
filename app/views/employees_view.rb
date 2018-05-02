class EmployeesView
  def display(employees)
    employees.each do |employee|
      puts "#{employee.id} username: #{employee.username}"
    end
  end
end
