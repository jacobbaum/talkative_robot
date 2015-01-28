require_relative 'person'

class Author < Person

  def initialize(args)
    super(args)
  end

  def about
    puts "My name is #{@name}. I am #{@age} years old. My gender is #{@gender}."
    puts "Today, I am #{@welfare}. Possible nicknames for me:"
    puts "#{@nicknames.join(", ")}. My color is #{@color}."
  end
  
end 