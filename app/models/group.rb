class Group < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_many :bills
  has_many :expensecategories

  validates :group_name,  :uniqueness => { :scope => :owner_id }
  validates :group_name, :owner_id,  presence: true
end