require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.

while message != 1
  puts "What's your question?"
  message = gets.chomp
  puts coach_answer_enhanced(message)
end
