require 'pry'
require 'csv'
				
def get_user_name
	print "Please enter your name: "
	gets.chomp
end	

def get_user_age
	print "Please enter your age: "
	gets.chomp.to_i
end

def get_user_gender
	print "Please enter your gender [M/F]: "
	gets.chomp.chars.first.upcase
end

def is_male?(user)
	user[:gender] == "M"
end	

def get_user_welfare
	welfares = [ "okay", "good", "outstanding" ]
	puts "How are you today? (Please pick one by entering its number.)"
	print "1. #{welfares[0]} 2. #{welfares[1]} 3. #{welfares[2]} "
	welfares[gets.chomp.to_i - 1]
end	

def determine_nicknames(user)
	nicknames = []
	print "Do you mind if I call you #{user[:name].slice(0)}? [Y/N] "
	if gets.chomp.chars.first.upcase == "N"
		nicknames.push "#{user[:name].slice(0)}" 
	end
	print "How about #{user[:name].slice(0, 2)}#{user[:name].chars.first.downcase}? [Y/N] "
	if gets.chomp.chars.first.upcase == "N"
		nicknames.push "#{user[:name].slice(0, 2)}#{user[:name].chars.first.downcase}" 
	end
	print "Maybe #{user[:name].slice(0, 3)}-#{user[:name].slice(0, 3)}? [Y/N] "
	if gets.chomp.chars.first.upcase == "N"
		nicknames.push "#{user[:name].slice(0, 3)}-#{user[:name].slice(0, 3)}" 
	end
	nicknames
end

def determine_color(user)
	if is_male?(user)
		user[:age] >= 50 ? user[:color] = "magenta" : user[:color] = "beige"
	else
		user[:age] >= 50 ? user[:color] = "ruby red" : user[:color] = "taupe"
	end
end			

def is_user_ernest(user)
	puts user[:name] == "Ernest" ? "I knew it was you!" : "Sorry you're not named Ernest."
end	

def about_a_person(person)
	if person[:role] == "author"
		to_be = "I am"
		possesive = "my"
		pronoun = "me" 
	else 
		to_be = "you are"
		possesive = "your"
		pronoun = "you"
	end	
	person.each do |k,v| 
		case k
		when :welfare
			puts "Today, #{to_be} #{v}."
		when :nicknames
			if person[:nicknames].any? 
				puts "Possible nicknames for #{pronoun} are #{person[:nicknames]
				.slice(0, person[:nicknames].count-1).join(", ")} and #{person[:nicknames].last}."
			end	
		else		
			puts "#{possesive.capitalize} #{k} is #{v}."
		end
	end	
	person
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

author = { role: "author", name: "Jacob", age: "33", gender: "M", welfare: "good", 
	nicknames: [ "J", "Jac Jac" ], color: "beige" }
user = { role: "user" }


# -- Getting to know each other --

tr_ary = "TALKATIVE!ROBOT".chars
fancy_intro = []
tr_ary.each.with_index { |char, i| fancy_intro.push("! " + "#{char} "*(i+1) + "! "*(14-i) + "!") }
fancy_intro.each { |line| print "#{line} #{line.reverse}\n" }

user[:name] 			= get_user_name

user_greeting(user)
is_user_ernest(user)

user[:age] 				= get_user_age

critique_user_age(user)

user[:gender] 		= get_user_gender

user[:welfare] 		= get_user_welfare

user[:nicknames] 	= determine_nicknames(user)

# if user[:nicknames].empty?
# 	puts "Thanks {#name}. Want to learn more about me? [Y/N]"
# else 
# 	puts "Thanks #{user[:nicknames].sample}! Want to learn more about me? [Y/N]"
# end

print user[:nicknames].empty? ? "Thanks #{user[:name]}. " : "Thanks #{user[:nicknames].sample}! "
print "Want to learn more about me? [Y/N] "
about_a_person(author) if gets.chomp.chars.first.upcase == "Y"
print "Want to see what I know about you? [Y/N] "
about_a_person(user) if gets.chomp.chars.first.upcase == "Y"

print user[:nicknames].empty? ? "#{user[:name]}" : "#{user[:nicknames].sample}"
print ", it's time for an outing. Press enter when you're ready. "
gets.chomp

# -- Grocery time --

print "**!** "*4 + "Shopping for Groceries " + "**!** "*4 + "\n"

binding.pry

# grocery_list = CSV.read("grocery_list.csv", { headers: true, header_converters: :symbol, converters: :numeric } )

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

print "I've had enough shopping. Press enter and I will reveal your color."
gets.chomp

user[:color] = determine_color(user)
decoration = "*!!*!!*!!*!!*!!*!!*!!*!!*!!*!!*!!*!!*!!*!!*"
color_dec = decoration[0, user[:color].length]
4.times { |i| puts i.even? ? "#{color_dec} #{user[:color].upcase} "*3 : "#{user[:color].upcase} #{color_dec} "*3 }


