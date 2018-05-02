require_relative 'base_repository'

class EmployeeRepository < BaseRepository
  undef_method :add

  def find_by_username(username)
    # find returns a single element
    @elements.find { |element| element.username == username }
  end

  def all_delivery_guys
    # select returns an array of elements
    @elements.select { |element| element.delivery_guy? }
  end

  private
  def build_element(row)
    row[:id] = row[:id].to_i
    Employee.new(row)
  end
end
