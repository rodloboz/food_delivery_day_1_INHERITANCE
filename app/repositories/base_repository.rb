class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @elements
  end

  def add(element)
    @element = element
    @element.id = @next_id
    @next_id += 1
    @elements << @element
    save_to_csv
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      @elements << build_element(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def save_to_csv
    CSV.open(@csv_file, 'w') do |csv|
      csv << @elements.first.class.headers
      @elements.each do |element|
        csv << element.to_csv_row
      end
    end
  end
end
