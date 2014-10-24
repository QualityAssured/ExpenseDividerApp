require 'rails_helper'

RSpec.describe Tag, :type => :model do

  describe "Tag" do

    it "should have a valid factory" do
      FactoryGirl.build(:tag).should be_valid
    end

    it "validates description is present" do
      FactoryGirl.build(:tag, :description => "").should_not be_valid
    end

    it "validates description is unique" do
      FactoryGirl.build(:tag, :description => "bla").should be_valid
      FactoryGirl.build(:tag, :description => "bla").should_not be_valid
    end

  end
end