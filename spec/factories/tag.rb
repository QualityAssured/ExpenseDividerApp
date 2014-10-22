FactoryGirl.define do
  factory :tag do
    association :user_id, factory: :user
    description "Red Bull"
  end
end



