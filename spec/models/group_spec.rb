require 'rails_helper'

RSpec.describe Group, :type => :model do

  describe "Group" do

    it "should have a valid factory" do
      expect(FactoryGirl.build(:group)).to be_valid
    end

    it "validates owner_id is present" do
      expect(FactoryGirl.build(:group, :owner_id => "")).to_not be_valid
    end

    it "validates group_name is present" do
      expect(FactoryGirl.build(:group, :group_name => "")).to_not be_valid
    end

    it "validates group_name is unique" do
      expect(FactoryGirl.create(:group, :group_name => "bla", :owner_id => 1)).to be_valid
      expect(FactoryGirl.build(:group,:group_name => "bla", :owner_id => 1)).to_not be_valid

    end

  end
end
