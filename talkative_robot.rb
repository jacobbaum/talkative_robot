require 'pry'
require './lib/person'
require './lib/user'
require './lib/author'
require './lib/groceryList'

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