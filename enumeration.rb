# # Enumeration: complete, ordered listing of all items in a collection.

# grocery_list = ["coffee", "some kind of vegetable", "beer", "milk", "apples"]
# grocery_list.each { |grocery| puts "- #{grocery.upcase}!! - "}


# grocery_list = ["coffee", "some kind of vegetable", "beer", "milk", "apples"]
# grocery_list.each do |grocery| 
# 	puts "- #{grocery.upcase}!! - "
# end


# gerry = { name: "GerBear" }
# marc = { name: "Marcus" }
# mike = { name: "Magic Mike" }
# instructors = [gerry, marc, mike]
# instructors.each { |instructor| puts instructor[:name] }

luke = {name: "Lucas", how_met: "Grace Pearson", age: 33}
lisa = {name: "Lisa", how_met: "Home Forward", age: 28}
adam = {name: "Adam", how_met: "Halfway House", age: 34}

friends = [luke, lisa, adam]

friends.each do |friend| 
	puts friend[:name]
	puts friend[:how_met]
end

friends.each { |friend| puts friend[:age] }
	



