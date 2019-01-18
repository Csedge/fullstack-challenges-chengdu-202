require_relative '../models/customer'
require_relative 'base_repository'

class CustomerRepository < BaseRepository
  private

  def headers
    %w{ id name address }
  end

  def serialize(element)
    [element.id, element.name, element.address]
  end

  def deserialize(row)
    row[:id] = row[:id].to_i
    Customer.new(row)
  end
end
