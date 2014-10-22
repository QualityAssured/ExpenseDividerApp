FactoryGirl.define do
  factory :bill do
    association :group_id, factory: :group
    description "Winkel"
    total "10"
  end
end