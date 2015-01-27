require 'spec_helper'
require_relative '../lib/person'
require_relative '../lib/groceryList'

describe Person do 

  subject(:test_person) do
    Person.new(name: "Jacob", age: 100, gender: "M", welfare: "okay")
  end

  describe ".new" do
    it "has a name" do
      expect( test_person.name ).to eq("Jacob")
    end
    it "has an age" do
      expect( test_person.age ).to eq(100)  
    end
    it "has a gender" do
      expect( test_person.gender ).to eq("M")
    end
    it "is having an okay day" do
      expect( test_person.welfare ).to eq("okay")
    end  
    it "doesn't need to have nicknames" do
      expect( test_person.nicknames ).to eq(nil)
    end  
    it "doesn't need to have a color" do
      expect( test_person.color ).to eq(nil)
    end     
  end


  context "is an old man" do
    let(:old_man) { Person.new(gender: "M", age: 90) }
    it "gets the color 'magenta'" do
      expect( old_man.determine_color ).to eq('magenta') 
    end
  end 

  context "is a young man" do 
    let(:young_man) { Person.new(gender: "M", age: 20) }
    it "gets the color 'beige'" do
      expect( young_man.determine_color ).to eq('beige') 
    end
  end

  context "is an old woman" do
    let(:old_woman) { Person.new(gender: "F", age: 90) }
    it "gets the color 'ruby red'" do
      expect( old_woman.determine_color ).to eq('ruby red') 
    end
  end 

  context "is a young woman" do 
    let(:young_woman) { Person.new(gender: "F", age: 20) }
    it "gets the color 'taupe'" do
      expect( young_woman.determine_color ).to eq('taupe') 
    end
  end

  describe "#male?" do
    context "is a dude" do
      let(:person_m) { Person.new(gender: "M") }
      it "is true" do
        expect( person_m.male? ).to be_truthy
      end
    end
  end
end

describe GroceryList do

  subject(:g_list) do
    GroceryList.new(["apples", "bananas"], "Jacob")
  end

  describe ".new" do
    it "has a list" do
      expect( g_list.list ).to eq(["apples", "bananas"])
    end

    it "has an owner" do
      expect( g_list.owner ).to eq("Jacob")
    end  
  end
  
  describe "#display" do
    it "formats a list for printing without altering it" do
      expect( g_list.display ).to eq(g_list.list)
    end
  end       
end



#Can do:
-apply method
-excape

eg,
an_item = list.random_item
expect g_list.list.include?(an_item).to be be_truthy

# describe GroceryList do
#   subject(:list) { GroceryList.new("../grocery_list.txt", "some_guy") }
#     it 'has a list' do
#       expect
#   describe '#display' do
#     it "prints out the list but doesn't change it." do
#       list.display
#       expect(list.size).to eq(2)
#     end
#    end
#   end  




#   it "deletes an item after it's grabbed from the shelf" do
#     expect
#   it "adds an item when that item is remembered"  


# has items 
# has an owner




# when an item is grabbed from the shelf, it is removed from the list.
#  when an item is remembered, it is added to the list. 

# describe Person do
#   describe "how tall" do
#    person.height
#   end  
# end
  