require 'pry'

class Person
	attr_reader :name, :age, :gender, :welfare, :nicknames, :color # only needed up here

	def initialize(args)
		@name 			= args[:name]   # can use || for or
		@age 				= args[:age]
		@gender 		= args[:gender]
		@welfare 		= args[:welfare]
		@nicknames 	= args[:nicknames]
		@color 			= args[:color] 
	end	

	def male?
		@gender == "M" #don't need the @ with 
	end	

	def determine_color
		if male?
			@age >= 50 ? @color = "magenta" : @color = "beige"   #don't need to @ here if 'getter' is set
		else
			@age >= 50 ? @color = "ruby red" : @color = "taupe"
		end
	end	

end

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
				
class User < Person
	
	def initialize(args)
		super(args)
	end

	def get_name
		print "Please enter your name: "
		@name = gets.chomp
	end	

	def get_age
		print "Please enter your age: "
		@age = gets.chomp.to_i
	end

	def get_gender
		print "Please enter your gender [M/F]: "
		case gets.chomp.chars.first.upcase
		when "M"
			@gender = "M"
		when "F"
			@gender = "F"
		else
			@gender = "Other"
		end			
	end

	def get_welfare
		welfares = [ "okay", "good", "outstanding" ]
		puts "How are you today? (Please pick one by entering its number.)"
		print "1. #{welfares[0]} 2. #{welfares[1]} 3. #{welfares[2]} "
		@welfare = welfares[gets.chomp.to_i - 1]
	end	

	def determine_nicknames
		@nicknames = []
		print "Do you mind if I call you #{@name.slice(0)}? [Y/N] "
		if gets.chomp.chars.first.upcase == "N"
			@nicknames.push "#{@name.slice(0)}" 
		end
		print "How about #{@name.slice(0, 2)}#{@name.chars.first.downcase}? [Y/N] "
		if gets.chomp.chars.first.upcase == "N"
			@nicknames.push "#{@name.slice(0, 2)}#{@name.chars.first.downcase}" 
		end
		print "Maybe #{@name.slice(0, 3)}-#{@name.slice(0, 3)}? [Y/N] "
		if gets.chomp.chars.first.upcase == "N"
			@nicknames.push "#{@name.slice(0, 3)}-#{@name.slice(0, 3)}" 
		end
	end

	def is_user_ernest
		puts @name == "Ernest" ? "I knew it was you!" : "Sorry you're not named Ernest."
	end	

	def user_greeting
		puts "Hi #{@name}!"
	end

	def critique_user_age
		puts @age % 2 == 0 ? "That's a nice, even age." : "That's an odd age." 
	end

	def about
		puts  "Your name is #{@name}. You are #{@age} years old. Your gender is #{@gender}."
		print  "Today, you are #{@welfare}."
		print " Possible nicknames for you are #{@nicknames.join(", ")}." if @nicknames.any?
		print " Your color is #{@color}." if @color.nil? == false
	end
end

class GroceryList
	attr_accessor :list, :owner

	def initialize(path_to_file, owner)
		@list = IO.read(path_to_file).split("\n")
		@owner = owner
	end

	def display
		@list.each { |item| puts "#{sprintf "%02d", (@list.index(item) + 1)} -- #{item.capitalize}" }
	end
		
	def random_item	
		@list.sample
	end

	def item_grabbed?(item) 
		print "Did you grab #{item}? [Y/N] "
		gets.chomp.upcase == "Y"
	end	

	def delete_item(item)
		@list.delete(item)
	end	

	def delete_item_if_grabbed(item)
		delete_item(item) if item_grabbed?(item)
	end

	def remember_item(item)
		puts "I just remembered that we need #{item}! I'm adding it to the list."
		@list << item
	end	
	
	def save_as(path_to_file)
		IO.write(path_to_file, @list.join("\n"))
	end

end

# -- Getting to know the user --

author  = Author.new(name: "Jacob", age: "33", gender: "M", welfare: "good", 
				 	nicknames: [ "J", "Jac Jac" ], color: "beige")

user 		= User.new({}) #(name: nil, age: nil, gender: nil, welfare: nil, 
					# nicknames: nil, color: nil) # all necessary? Seems like there should be a better way.

# Could have made Class variables instead eg, User.get_name
# method would have looked like: def self.get_name \n print "Name: " \n gets.chomp

user.get_name
user.user_greeting
user.is_user_ernest

user.get_age
user.critique_user_age

user.get_gender

user.get_welfare

user.determine_nicknames

print user.nicknames.empty? ? "Thanks #{user.name}. " : "Thanks #{user.nicknames.sample}! "
print "Want to learn more about me? [Y/N] "
author.about if gets.chomp.chars.first.upcase == "Y"
print "Want to see what I know about you? [Y/N] "
user.about if gets.chomp.chars.first.upcase == "Y"

print user.nicknames.empty? ? "\n#{user.name}" : "\n#{user.nicknames.sample}"
print ", it's time for an outing. Press enter when you're ready. "
gets.chomp

# -- Going shopping with the user --

print "**!** "*4 + "Shopping for Groceries " + "**!** "*4 + "\n"

puts "#{user.name}, we are shopping for groceries.  Currently. Right now. Surprise!"

grocery_list = GroceryList.new("grocery_list.txt", user)

puts "I just gave you a grocery list. You are it's new owner. Here's what is on it:"
grocery_list.display

grocery_list.delete_item_if_grabbed(grocery_list.random_item)

grocery_list.remember_item("cereal")

puts "I've had enough shopping. I'm saving the list for later."
grocery_list.save_as("new_grocery_list.txt")

print "Press enter and I will reveal your color."
gets.chomp

user.determine_color
decoration = "*!!*!!*!!*!!*!!*!!*"
color_dec = decoration[0, user.color.length]
4.times do |i| 
	if i.even?  
		puts "#{color_dec} #{user.color.upcase} "*3  
	else
		puts "#{user.color.upcase} #{color_dec} "*3 
	end	
end

print "Press enter again to see Gerry's color."
gets.chomp

current_user = User.new(name: "Gerry", age: 28, gender: "M")

current_user.determine_color
puts "-!- #{current_user.color.upcase} -!- "*5

print "Press enter one more time to give Gerry the grocery list. Then, we're all done!"
gets.chomp

grocery_list.owner = current_user
puts "The list's new owner is #{grocery_list.owner.name}."

binding.pry