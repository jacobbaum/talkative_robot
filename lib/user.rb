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

  def generate_nickname(first_letter, length, repetitions)
    names = name.slice(first_letter-1, length)
    repetitions == 1 ? nick = names : nick = names << "-#{names}"*(repetitions-1)
  end    
      
  def determine_nicknames
    @nicknames = []
    possible_nicknames = [generate_nickname(1,1,1), generate_nickname(1,2,1), generate_nickname(1,3,2)]
    possible_nicknames.each_index do |i|
      print "Do you mind if I call you #{possible_nicknames[i]}? [Y/N] "
      @nicknames.push "#{possible_nicknames[i]}" if gets.chomp.chars.first.upcase == "N"   
    end    
  end

  def is_user_ernest?
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
