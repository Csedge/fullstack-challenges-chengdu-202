class BaseView
  def ask_for(stuff)
    puts "enter #{stuff}:"
    print '> '
    gets.chomp
  end

  def ask_for_i(stuff)
    input = ask_for(stuff)

    if input =~ /\A\d+\z/
      input.to_i
    else
      puts "bad input, try again"
      ask_for_i(stuff)
    end
  end
end
