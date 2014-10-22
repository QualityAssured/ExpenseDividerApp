class Groups_users < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
end