json.extract! message, :id, :user_id, :user_name, :content, :content_types
json.reaction_ids message.message_reactions.map(&:reaction_id)
json.created_at message.created_at.strftime('%Y-%m-%d %H:%M:%S')
