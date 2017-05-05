FactoryGirl.define do

  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Number.password(8) }
    password_confirmation { Faker::Number.password_confirmation(8) }
  end

end
