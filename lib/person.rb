class Person
  attr_reader :name, :age, :gender, :welfare, :nicknames # only needed up here
  attr_accessor :color

  def initialize(args)
    @name       = args[:name]   # can use || for or
    @age        = args[:age]
    @gender     = args[:gender]
    @welfare    = args[:welfare]
    @nicknames  = args[:nicknames]
    @color      = args[:color] 
  end 

  def male?
    gender == "M" #don't need the @ with 
  end 

  def determine_color
    if male?
      color = age >= 50 ?  "magenta" : "beige"   #don't need to @ here if 'getter' is set
    else
      color = age >= 50 ?  "ruby red" : "taupe"
    end
  end 

end