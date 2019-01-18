require_relative '../repositories/base_repository'
require_relative '../models/employee'

class EmployeeRepository < BaseRepository
  def all_delivery_guys
    all.select { |e| e.delivery_guy? }
  end

  def find_by_username(username)
    all.find { |e| e.username == username }
  end

  private

  def add(employee)
    # do nothing
  end

  def headers
    %w{ id username password role }
  end

  def serialize(e)
    [e.id, e.username, e.password, e.role]
  end

  def deserialize(row)
    row[:id] = row[:id].to_i

    Employee.new(row)
  end
end
