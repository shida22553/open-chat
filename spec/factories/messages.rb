FactoryBot.define do
  factory :message do
    association :room
    user_name { 'MyString' }
    user_id { 'MyString' }
    content { 'MyText' }
    type { 1 }
  end
end
