FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    password "Test456"
    first_name "Joanne"
    last_name "Peters"
    admin false
  end

  factory :admin, class: User do
    email
    password "qwertyuiop"
    admin true
    first_name "Admin"
    last_name "User"
  end
end
