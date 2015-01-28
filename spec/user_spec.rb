require 'spec_helper'
require_relative '../lib/user'

describe User do

  describe "generate_nickname" do

    context "'Gerry'" do
      let (:gerry) { User.new(name: "Gerry") }
      it "can have the nickname 'G'" do
        expect( gerry.generate_nickname(1, 1, 1) ).to eq("G")
      end
      it "can have the nickname 'Ger-Ger'" do
        expect( gerry.generate_nickname(1, 3, 2) ).to eq("Ger-Ger")
      end
      it "can have the nickname 'erry'" do
        expect( gerry.generate_nickname(2, 4, 1) ).to eq("erry")
      end    
    end
  end

end