# class Person
#   def initialize(args)
#     @gender = args[:gender]
#   end
#   def male?
#     @gender == "M"
#   end
# end

class Person
  attr_reader :name, :age, :gender, :welfare, :nicknames, :color # only needed up here

  def initialize(args)
    @name       = args[:name]   # can use || for or
    @age        = args[:age]
    @gender     = args[:gender]
    @welfare    = args[:welfare]
    @nicknames  = args[:nicknames]
    @color      = args[:color] 
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