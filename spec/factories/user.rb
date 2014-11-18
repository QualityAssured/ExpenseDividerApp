FactoryGirl.define do
  factory :user do
    sequence :username do |n|
      "John#{n}"
    end
    sequence :email do |n|
      "John#{n}@bla.com"
    end
    password "clip3333"
    password_confirmation "clip3333"
  end
end