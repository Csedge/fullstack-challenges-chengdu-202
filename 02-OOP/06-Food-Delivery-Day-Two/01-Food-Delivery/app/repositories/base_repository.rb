require 'csv'

class BaseRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    load_data
  end

  def all
    @elements
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  def add(element)
    element.id = @next_id
    @elements << element
    save_data
    @next_id += 1
  end

  private

  def save_data
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << headers
      @elements.each do |element|
        csv << serialize(element)
      end
    end
  end

  def load_data
    @elements = []
    if File.exist?(@csv_file_path)
      CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
        @elements << deserialize(row)
      end
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end
end
