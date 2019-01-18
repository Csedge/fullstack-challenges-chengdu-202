require_relative "wagon_sort"

# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  http://www.ruby-doc.org/core-2.4.0/Kernel.html#method-i-gets
#       - `chomp`: http://www.ruby-doc.org/core-2.4.0/String.html#method-i-chomp



students = []

puts "Type a student name:"
user_type = gets.chomp

while user_type != ""
  puts "Type another student name or press enter to finish:"
  students << user_type
  user_type = gets.chomp
end

# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list
lists = wagon_sort(students)


puts "Congratulations! Your Wagon has #{lists.count} students:"
# print "- "
# last_student = lists.pop
# print lists.join(', ') + " and #{last_student}"
# puts

print lists.take(lists.length - 1).join(", ")
print " and #{lists.last}"
puts
