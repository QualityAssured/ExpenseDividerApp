FactoryGirl.define do

  factory :group do
    group_name "Alibabaendeveertigrovers"
    owner_id { FactoryGirl.create(:user).id }
  end
end

