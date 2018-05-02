class BaseView
  def ask_for(label)
    puts "What is the #{label}"
    print "> "
    gets.chomp
  end
end
