FactoryGirl.define do

  factory :group do
    users {[User.find(owner_id)]}
    association :owner_id, factory: :user
    group_name "Alibabaendeveertigrovers"
  end
end

