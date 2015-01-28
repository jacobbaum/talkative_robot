class GroceryList
  attr_accessor :list, :owner

  # def initialize(path_to_file, owner)
  #   @list = IO.read(path_to_file).split("\n")
  #   @owner = owner
  # end

  # for testing without IO
  def initialize(list, owner)
    @list  = list
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
    list.delete(item)
  end 

  def delete_item_if_grabbed(item)
    delete_item(item) if item_grabbed?(item)
  end

  def remember_item(item)
    puts "I just remembered that we need #{item}! I'm adding it to the list."
    list << item
  end 
  
  def save_as(path_to_file)
    IO.write(path_to_file, list.join("\n"))
  end

end