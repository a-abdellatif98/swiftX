FactoryBot.define do
  factory :user do
    email { "MyString" }
    password { "MyString" }
    password_confirmation { "MyString" }
    admin { false }
    user_maneger { false }
  end
end
