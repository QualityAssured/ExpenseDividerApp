class Bill < ActiveRecord::Base

  belongs_to :user
  has_many :tags_with_amounts

  validates :description, :total, :user_id, :group_id, presence: true

end