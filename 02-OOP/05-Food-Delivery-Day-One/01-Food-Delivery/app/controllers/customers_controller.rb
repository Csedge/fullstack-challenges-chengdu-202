require_relative '../repositories/customer_repository'
require_relative '../views/customers_viewer'

class CustomersController
  def initialize(repository)
    @repository = repository
    @view = CustomersViewer.new
  end

  def list
    @view.display_customers(@repository.all)
  end

  def add
    name = @view.input_name
    address = @view.input_address
    customer = Customer.new(name: name, address: address)
    @repository.add(customer)
  end

end
