FactoryBot.define do
  factory :message_reaction do
    user_id { 'MyString' }
    user_name { 'MyString' }
    message { nil }
    reaction { nil }
  end
end
