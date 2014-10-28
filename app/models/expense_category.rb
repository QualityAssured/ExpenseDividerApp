class ExpenseCategory < ActiveRecord::Base
  belongs_to :group
  validates_presence_of :group_id
  validates :description,  :uniqueness => { :scope => :group_id }
end