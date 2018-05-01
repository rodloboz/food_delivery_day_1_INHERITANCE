class CustomerRepository < BaseRepository
  private

  def build_element(row)
    row[:id] = row[:id].to_i
    Customer.new(row)
  end
end
