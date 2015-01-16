require 'pry'
				
def get_user_name
	print "Please enter your name:"
	gets.chomp
end	

def get_user_age
	print "Please enter your age: "
	gets.chomp.to_i
end

def get_user_gender
	gender = ""
	until gender == "M" || gender == "F" do
		print "Please enter your gender [M/F]: "
		gender = gets.chomp.chars.first.upcase
	end
end

def get_user_welfare
	print "In one word, how are you today?"
	gets.chomp
end

def determine_nicknames(user)
	nicknames = []
	
	print "Do you mind if I call you #{user[:name].slice(0)}? [Y/N]"
	if gets.chomp.chars.first.upcase == "N"
		nicknames.push "#{user[:name].slice(0)}" 
	end
	
	print "How about #{user[:name].slice(0, 2)}#{user[:name].chars.first}? [Y/N]"
	if gets.chomp.chars.first.upcase == "N"
		nicknames.push "#{user[:name].slice(0, 2)}#{user[:name].chars.first}" 
	end
	
	print "Maybe #{user[:name].slice(0, 3)}-#{user[:name].slice(0, 3)}? [Y/N]"
	if gets.chomp.chars.first.upcase == "N"
		nicknames.push "#{user[:name].slice(0, 3)}-#{user[:name].slice(0, 3)}" 
	end
end

# Rewritten with 'user' argument
def determine_user_color (user)
	age = user[:age]
	gender = user[:gender]
	if age >= 50 && gender == "M"
	"magenta"
	elsif age < 50 && gender == "M"
	"beige"
	elsif age >= 50 && gender == "F"
	"ruby red"
	else 
	"taupe"
	end
end

def is_user_ernest(user)
	puts user[:name] == "Ernest" ? "I knew it was you!" : "Sorry you're not named Ernest."
end	

def about_a_person(person)
	person.each { |k,v| puts "My #{k.to_s} is #{v}"}
end

def user_greeting(user)
	puts "Hi #{user[:name]}!"
end

def critique_user_age(user)
	puts user[:age] % 2 == 0 ? "That's a nice, even age." : "That's an odd age." 
end

def display_list(list)
	list.each { |item| puts "#{sprintf "%02d", (list.index(item) + 1)} -- #{item.capitalize}" }
end

def was_grocery_grabbed(grocery_list)
	random_grocery = grocery_list.sample
	print "Did you grab #{random_grocery}? [Y/N] "
	if gets.chomp.upcase == "Y"
		grocery_list.delete(random_grocery)
		puts "Thanks! You're the best!"
	else
		puts "That's okay, but I'm beginning to question your status as 'the best'."
	end
end

author = {name: "Jacob", age: "33", gender: "M", welfare: "okay", color: "beige"}
user = {}
people = [author, user]

user[:name] 			= get_user_name

user_greeting(user)
is_user_ernest(user)

user[:age] 				= get_user_age

critique_user_age(user)

user[:gender] 		= get_user_gender

user[:welfare] 		= get_user_welfare

user[:nicknames] 	= determine_nicknames(user)


print "Would you like to know more about me? [Y/N] "
about_a_person(people[0]) if gets.chomp.chars.first.upcase == "Y"

# -- Grocery Time --

grocery_list = IO.read("grocery_list.txt").split("\n")
forgotten_groceries = ["cereal", "bananas", "40 pounds of dog food"]

puts "#{user[:name]}, we are shopping for groceries.  Currently. Right now. Surprise!"

puts "Here's what we need:"
display_list(grocery_list)

was_grocery_grabbed(grocery_list)

remembered_grocery = forgotten_groceries.shift
puts "Oh, I just remembered, we need #{remembered_grocery}!"
grocery_list << remembered_grocery

IO.write("new_grocery_list.txt", grocery_list.join("\n"))

puts "Now, I will reveal your color:"
user[:color] = determine_user_color(user)
10.times do
	puts "* * -!- * * * -!-!- #{user[:color].upcase} -!-!- * * * -!- * *" 
end
