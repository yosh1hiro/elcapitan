FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    password 'secret'
    password_confirmation 'secret'

    factory :admin do
      name 'admin.mayname'
      email Faker::Internet.email
    end

    factory :invalid_user do
      name nil
    end
  end
end
