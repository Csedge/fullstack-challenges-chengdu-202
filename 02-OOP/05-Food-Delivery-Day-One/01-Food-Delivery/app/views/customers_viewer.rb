class CustomersViewer
  def initialize
  end

  def display_customers(customer)
    customer.each do |customer|
      puts "#{customer.id}, #{customer.name}, #{customer.address}"
    end
  end

  def input_name
    puts "Name: >"
    gets.chomp
  end

  def input_address
    puts "Address: >"
    gets.chomp
  end
end
