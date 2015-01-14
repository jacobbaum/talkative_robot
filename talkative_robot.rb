				# puts "Please enter your name:"
				# name = gets.chomp
name = "Jacob"

				# puts "Please enter your gender (M/F):"
				# gender = gets.chomp
gender = "F"

puts name == "Ernest" ? "I knew it was you!" : "Sorry you're not Ernest."

				# puts "Please enter your age:"
				# age = gets.chomp.to_i
age = 90

puts "Hi #{name}, who is #{age} years old!"

puts "That's a nice, even age." if age % 2 == 0 
puts "#{age}, that's odd." unless age % 2 == 0

if age < 80
	puts "You are not yet in the zone."
elsif age > 82
	puts "How was the zone? I've heard good things."	
else
	puts "You are in the zone."
end

puts "Do you mind if I call you #{name.slice(0)}?"

puts "How about #{name[0]}?"


case age
when 0..73 
	puts "You will be 75 years old in #{75 - age} years."
when 74
	puts "You will be 75 in mere months!"
when 75..999
	puts "You will be 75 in #{75 - age} years if time starts moving backward."
end

name.upcase!

puts "Hey #{name}, Where are you going!?"

puts "Hey \"Dude\", what's up?"

if age > 60 && gender == "M" || gender == "F"
puts "Is it innapropriate to call you dude?"
end


if age >= 50 && gender == "M"
	color = "magenta"
elsif age < 50 && gender == "M"
	color = "beige"
elsif age >= 50 && gender == "F"
	color = "ruby on rails red"
else 
	color = "taupe"
end

puts "Your gender and age correspond to the color #{color}."
