json.extract! message, :id, :user_id, :user_name, :content, :content_type
json.message_reactions do
  json.array! message.message_reactions do |message_reaction|
    json.partial! 'message_reaction', message_reaction: message_reaction
  end
end
json.created_at message.created_at.strftime('%Y-%m-%d %H:%M:%S')
