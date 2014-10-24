require 'rails_helper'

RSpec.describe Bill, :type => :model do

  describe "Bill" do

    it "should have a valid factory" do
      FactoryGirl.build(:bill, :group_id => "1").should be_valid
    end

    it "validates user_id is present" do
      FactoryGirl.build(:bill, :user_id => "").should_not be_valid
    end

    it "validates description is present" do
      FactoryGirl.build(:bill, :description => "").should_not be_valid
    end

    it "validates total is present" do
      FactoryGirl.build(:bill, :total => "").should_not be_valid
    end

    it "validates group_id is present" do
      FactoryGirl.build(:bill, :group_id => "").should_not be_valid
    end
  end
end
