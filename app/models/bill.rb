class Bill < ActiveRecord::Base

  belongs_to :user
  has_many :tags_with_amounts
end