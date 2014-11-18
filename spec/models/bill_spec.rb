require 'rails_helper'

RSpec.describe Bill, :type => :model do

  describe "Bill" do

    it "should have a valid factory" do
      expect(FactoryGirl.build(:bill, :group_id => "1")).to be_valid
    end

    it "validates user_id is present" do
      expect(FactoryGirl.build(:bill, :user_id => "")).to_not be_valid
    end

    it "validates description is present" do
      expect(FactoryGirl.build(:bill, :description => "")).to_not be_valid
    end

    it "validates total is present" do
      expect(FactoryGirl.build(:bill, :total => "")).to_not be_valid
    end

    it "validates group_id is present" do
      expect(FactoryGirl.build(:bill, :group_id => "")).to_not be_valid
    end
  end
end
