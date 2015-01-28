require 'spec_helper'
require_relative '../lib/person'

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

  describe "#determine_color" do

    context "old man" do
      let(:old_man) { Person.new(gender: "M", age: 90) }
      it "returns magenta" do
        expect( old_man.determine_color ).to eq('magenta')
      end
    end

    context "young man" do
      let(:young_man) { Person.new(gender: "M", age: 20) }
      it "returns beige" do
        expect( young_man.determine_color ).to eq('beige')
      end
    end

      context "old woman" do
      let(:old_woman) { Person.new(gender: "F", age: 90) }
      it "returns'ruby red'" do
        expect( old_woman.determine_color ).to eq('ruby red') 
      end
    end 

    context "young woman" do 
      let(:young_woman) { Person.new(gender: "F", age: 20) }
      it "returns 'taupe'" do
        expect( young_woman.determine_color ).to eq('taupe') 
      end
    end

  end

end