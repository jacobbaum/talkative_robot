require 'pry'
				
def get_users_name
	print "Please enter your name:"
	gets.chomp
end	

def get_users_age
	print "Please enter your age:"
	gets.chomp.to_i
end

def get_users_gender
	print "Please enter your gender [M/F]:"
	gets.chomp.upcase
end

def get_users_welfare
	print "In one word, how are you today?"
	gets.chomp
end

def determine_users_color (age, gender)
	if age >= 50 && gender == "M"
	"magenta"
	elsif age < 50 && gender == "M"
	"beige"
	elsif age >= 50 && gender == "F"
	"ruby on rails red"
	else 
	"taupe"
	end
end

def determine_users_zone_position(age)
	the_zone = 81
	if age < the_zone
	"Pre-Zone"
	elsif age > the_zone
	"Post-Zone"	
	else
	"In the Zone"
	end
end

user = {}

user[:name] = get_users_name
puts user[:name] == "Ernest" ? "I knew it was you!" : "Sorry you're not named Ernest."

user[:age] = get_users_age
puts "Hi #{user[:name]}, who is #{user[:age]} years old!"
puts user[:age] % 2 == 0 ? "That's a nice, even age." : "That's an odd age." 

user[:gender] = get_users_gender
# I didn't end up doing anything with 'welfare'
user[:welfare] = get_users_welfare

user[:color] = determine_users_color(user[:age], user[:gender])
# Didn't end up doing anything with 'zone_position' either.  It's in the the 
# user hash, though
user[:zone_position] = determine_users_zone_position(user[:age]) 

# Might use these and others to make array of acceptable nicknames
puts "Do you mind if I call you #{user[:name].slice(0)}?"
puts "How about #{user[:name].chars.first}?"
puts "Maybe #{user[:name].slice(0, 3)}-#{user[:name].slice(0, 3)}?"
puts "#{user[:name]}-arino?"

grocery_list = ["coffee", "some kind of vegetable", "beer", "milk", "apples"]
# Wanted to try moving items from one array to another, so
forgotten_groceries = ["cereal", "bananas", "40 pounds of dog food"]

puts "#{user[:name]}, we are shopping for groceries.  Currently. Right now. Surprise!"

random_grocery = grocery_list.sample

# This needs to be cleaned up. Another time. Maybe write a method 'item_grabbed' 
# that returns true or false?
print "Did you grab #{random_grocery}? [Y/N]"
gets.chomp.upcase == "Y" ? item_grabbed = true : item_grabbed = false

if item_grabbed
	grocery_list.delete(random_grocery)
	puts "Thanks! You're the best!"
else 
	puts "That's okay, but I'm beginning to question your status as 'the best'."
end

remembered_grocery = forgotten_groceries.shift
puts "Oh, I just remembered, we need #{remembered_grocery}!"
grocery_list << remembered_grocery

puts "All together, we still need:"
#I got ahead of myself, here, but '.each' with a block looked like an easy way 
#to style and print the list
grocery_list.each { |grocery| puts "- #{grocery.upcase}!! - "}

puts "Now, I will reveal your color:"
puts " --- #{user[:color].upcase} --- "






# Some nonworking code from the method lab. I was expecting this to return a 
# variable called 'welfare'.  It didn't. What went wrong?

# def get_users_welfare
# 	puts "In one word, how are you today?"
# 	welfare = gets.chomp
# 	return welfare
# end

# get_users_welfare
# puts "#{name}, you are #{welfare.downcase}."

# I want to go back to this case statement, but I also want to go home tonight
# def years_until_seventy_five(current_age)
# 	case current_age
# 	when 0..73 
# 		puts "You will be 75 years old in #{75 - current_age} years."
# 	when 74
# 		puts "You will be 75 in mere months!"
# 	when 75..999
# 		puts "You will be 75 in #{(75 - current_age).abs} years if time starts moving backward."
# 	end
# end

# years_until_seventy_five(age)
