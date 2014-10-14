class Tag < ActiveRecord::Base

 belongs_to :user
  validates :description, presence: true
  validates :description,  :uniqueness => { :scope => :user_id }

end