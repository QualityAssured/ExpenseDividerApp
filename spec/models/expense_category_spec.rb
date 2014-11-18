require 'rails_helper'

RSpec.describe ExpenseCategory, :type => :model do

  it "should have a valid factory" do
    expect(FactoryGirl.build(:expense_category)).to be_valid
  end

  it "validates group_id is present" do
    expect(FactoryGirl.build(:expense_category, :group_id => "")).to_not be_valid
  end

  it "validates description is unique" do
    FactoryGirl.create(:expense_category, :description => "Delhaize")
    expect(FactoryGirl.build(:expense_category, :description => "Delhaize")).to_not be_valid
  end

end
