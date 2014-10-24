require 'rails_helper'

RSpec.describe Group, :type => :model do

  describe "Group" do

    it "should have a valid factory" do
      FactoryGirl.build(:group).should be_valid
    end

    it "validates owner_id is present" do
      FactoryGirl.build(:group, :owner_id => "").should_not be_valid
    end

    it "validates group_name is present" do
      FactoryGirl.build(:group, :group_name => "").should_not be_valid
    end

    it "validates group_name is unique" do
      FactoryGirl.create(:group,:id => 1, :group_name => "bla", :owner_id => 1).should be_valid
      FactoryGirl.build(:group,:id => 2, :group_name => "bla", :owner_id => 1).should_not be_valid
    end

  end
end
