FactoryGirl.define do
  factory :group do
    association :owner_id, factory: :user
    group_name "Alibabaendeveertigrovers"
  end
end

