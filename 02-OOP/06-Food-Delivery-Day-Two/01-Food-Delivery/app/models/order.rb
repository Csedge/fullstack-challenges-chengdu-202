require_relative 'base_model'
require_relative 'meal'

class Order < BaseModel
  attributes :delivered, :meal, :employee, :customer

  def initialize(attributes = {})
    @id = attributes[:id]
    @delivered = attributes[:delivered] || false
    @meal = attributes[:meal]
    @employee = attributes [:employee]
    @customer = attributes[:customer]
  end


  def delivered?
    @delivered | false
  end

  def deliver!
    @delivered = true
  end


end







