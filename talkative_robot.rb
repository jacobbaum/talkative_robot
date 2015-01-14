# Create a Ruby script that:
# Asks for user’s name
# Asks for user’s age
# Prints: “Hi name, who is age years old!” via interpolation
# Prints: “Do you mind if I call you first_initial?”
# Prints: “You will be 75 years old in years years.” via interpolation
# Permanently change user’s name to all caps via !
# Prints: “Hey first_name_in_caps, where are you going!?”
# Prints: “Hey “Dude”, what’s up?”

# Bonus - Talkative Robot
# If their name is Ernest, print “I knew it was you!” If not, “Sorry, you’re not Ernest.”

puts "Please enter your name:"
name = gets.chomp

if name == "Ernest"
	puts "I knew it was you!"
else
	puts "Sorry you're not Ernest."
end	

puts "Please enter your age:"
age = gets.chomp.to_i

puts "Hi #{name}, who is #{age} years old!"

puts "Do you mind if I call you #{name.slice(0)}?"

puts "How about #{name[0]}?"

puts "You will be 75 years old in #{75 - age} years."

name.upcase!

puts "Hey #{name}, Where are you going!?"

puts "Hey \"Dude\", what's up?"