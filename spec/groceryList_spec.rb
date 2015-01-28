require 'spec_helper'
require_relative '../lib/groceryList'

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

  describe "#random_item" do
     it "returns a random item" do
      an_item = g_list.random_item
      expect( g_list.list.include?(an_item) ).to be_truthy
    end
  end    
     
  describe "#delete_item" do
    it "deletes the specified item" do
      an_item = g_list.list[0]
      g_list.delete_item(an_item)
      expect( g_list.list.include?(an_item) ).to be_falsey
    end
  end

  describe "#remember_item" do
    it "adds an item" do
      g_list.remember_item("milk")
      expect( g_list.list.include?("milk") ).to be_truthy
    end
  end    

end 