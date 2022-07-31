FactoryBot.define do
  factory :comment do
    comment { 'test1234567' }
    association :post
    association :user
  end
end
