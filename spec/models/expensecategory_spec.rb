require 'rails_helper'

RSpec.describe Expensecategory, :type => :model do

  it "should have a valid factory" do
    FactoryGirl.build(:expensecategory).should be_valid
  end

  it "validates group_id is present" do
    FactoryGirl.build(:expensecategory, :group_id => "").should_not be_valid
  end

  it "validates description is unique" do
    FactoryGirl.create(:expensecategory, :description => "Delhaize")
    FactoryGirl.build(:expensecategory, :description => "Delhaize").should_not be_valid
  end

end
