require_relative 'base_view'

class SessionsView < BaseView
  def display_error(message)
    puts '--------------------'
    puts "#{message}, try again"
    puts '--------------------'
    puts
  end
end
