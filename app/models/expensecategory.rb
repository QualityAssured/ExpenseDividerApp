class Expensecategory < ActiveRecord::Base
  belongs_to :group
  validates_presence_of :group_id
  validates :description,  :uniqueness => { :scope => :group_id }
  validates_presence_of :description
end