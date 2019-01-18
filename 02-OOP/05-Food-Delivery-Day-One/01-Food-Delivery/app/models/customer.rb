# class Customer
#   attr_accessor :id
#   attr_reader :name, :address

#   def initialize(attrs = {})
#     @id = attrs[:id]
#     @name = attrs[:name]
#     @address = attrs[:address]
#   end
# end

# Customer.attr_accessor(:id)

require_relative 'base_model'

class Customer < BaseModel
  # Customer.attributes(:name, :address)
  attributes :name, :address
end

# c = Customer.new(name: 'Alice', address: 'WeWork')

# puts c.name
# puts c.address
# c.name = 'Bob'
