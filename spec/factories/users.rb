FactoryBot.define do
  factory :user do
    username { 'testuser' }
    email { 'test@example.com' }
    password { 'test1234' }
    password_confirmation { 'test1234' }
  end
end
