require 'rails_helper'

RSpec.describe ExpenseCategory, :type => :model do

  it "should have a valid factory" do
    FactoryGirl.build(:expense_category).should be_valid
  end

  it "validates group_id is present" do
    FactoryGirl.build(:expense_category, :group_id => "").should_not be_valid
  end

  it "validates description is unique" do
    FactoryGirl.create(:expense_category, :description => "Delhaize")
    FactoryGirl.build(:expense_category, :description => "Delhaize").should_not be_valid
  end

end
