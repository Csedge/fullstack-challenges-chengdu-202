require_relative '../repositories/meal_repository.rb'
require_relative '../models/meal.rb'
require_relative '../repositories/customer_repository.rb'
require_relative '../models/customer.rb'
require_relative '../repositories/employee_repository.rb'
require_relative '../models/employee.rb'
require_relative '../repositories/order_repository.rb'
require_relative '../models/order.rb'
require_relative '../views/customers_viewer.rb'
require_relative '../views/meals_viewer.rb'
require_relative '../views/sessions_view.rb'
require_relative '../views/viewer.rb'
# require_relative 'sessions_controller'


class OrdersController
  attr_accessor :meal_repository, :customer_repository, :employee_repository, :order_repository
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @view = Viewer.new
  end

  def list_undelivered_orders
    @order_repository.undelivered_orders.each do |order|
    puts "#{order.meal.name} \n
           #{order.employee.username} \n
           #{order.customer.name} \n
           #{order.customer.address}"
    end
  end

  def add
    meal_id = @view.ask_user_for_meal_id.to_i
    meal = @meal_repository.find(meal_id)
    customer_id = @view.ask_user_for_customer_id.to_i
    customer = @customer_repository.find(customer_id)
    employee_id = @view.ask_user_for_employee_id.to_i
    employee = @employee_repository.find(employee_id)
    new_order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.add(new_order)
  end

  def list_my_orders(employee)
    @order_repository.undelivered_orders.each do |order|
      if order.employee.username == employee.username
        puts "#{order.customer.name}, #{order.meal.name}"
      end
    end
  end

  def mark_as_delivered(employee)
    order_id = @view.ask_delivery_guy_for_order_id
    @order_repository.undelivered_orders.each do |order|
      if order.id == order_id.to_i
        order.deliver!
      end
    end
      @order_repository.save_to_csv
  end
end
