require 'csv'
require_relative 'base_repository'
require_relative '../models/order'
require_relative 'meal_repository.rb'
require_relative 'customer_repository.rb'
require_relative 'employee_repository.rb'

class OrderRepository < BaseRepository
  def initialize(csv_file_path, meal_repository, employee_repository, customer_repository)
    @csv_file_path = csv_file_path
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @orders = []
    @next_id = @next_id || 1
    load_csv
  end


  def load_csv
    if File.exist?(@csv_file_path)
        csv_options = { headers: :first_row, header_converters: :symbol }
        CSV.foreach(@csv_file_path, csv_options) do |row|
          row[:id] = row[:id].to_i
          row[:delivered] = row[:delivered] == "true"
          row[:meal] = @meal_repository.find(row[:meal_id].to_i)
          row[:employee] = @employee_repository.find(row[:employee_id].to_i)
          row[:customer] = @customer_repository.find(row[:customer_id].to_i)
        @orders << Order.new(row)
        end
        @next_id = @orders.empty? ? 1 : @orders.last.id + 1
    end
  end

  def save_to_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ["id", "delivered", "meal_id", "employee_id", "customer_id"]
      @orders.each do |order|
        csv << [order.id, order.delivered, order.meal.id, order.employee.id, order.customer.id]
      end
    end
  end

  def undelivered_orders
    @orders.select {|order| order.delivered == false}
  end

  def add(order)
    order.id = @next_id
    @next_id += 1
    @orders << order
    save_to_csv
  end
end
