class Group < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_many :bills
  has_many :expense_categories
end