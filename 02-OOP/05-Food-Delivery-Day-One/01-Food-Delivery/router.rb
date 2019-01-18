class Router
  def initialize(meals_controller, sessions_controller)
    @meals_controller = meals_controller
    @sessions_controller = sessions_controller
  end

  def run
    @employee = @sessions_controller.sign_in

    print_welcome_message

    loop do
      # 1. Print the menu
      print_menu
      # 2. Ask the user what he/she wants to do next?
      action = get_action
      # 3. Call the right controller method
      dispatch(action)
    end
  end

  private

  def print_welcome_message
    if @employee.manager?
      puts "welcome our supreme leader, guardian of the north, the unburn... #{@employee.username}"
    else
      puts "shut up and get to work"
    end
  end

  def dispatch(action)
    if @employee.manager?
      case action
      when 1 then @meals_controller.add
      when 2 then @meals_controller.list
      when 0 then exit
      else
        puts 'Wrong action'
      end
    else
      # do something else
    end
  end

  def get_action
    puts 'What do you want to do next?'
    print '> '
    gets.chomp.to_i
  end

  def print_menu
    if @employee.manager?
      puts '1. Add a meal'
      puts '2. List available meals'
      puts '0. quit'
    else
      puts '1. view all orders'
      puts '2. mark an order as delivered'
      puts '0. quit'
    end
  end
end
