FactoryBot.define do
  factory :message do
    association :room
    user_name { 'MyString' }
    user_id { 'MyString' }
    content { 'MyText' }
    content_type { 0 }
  end
end
