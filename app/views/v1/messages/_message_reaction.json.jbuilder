json.id message_reaction.id
json.user_id message_reaction.user_id
json.user_name message_reaction.user_name
json.message_id message_reaction.message_id
json.reaction do
  json.partial! 'v1/reactions/reaction', reaction: message_reaction.reaction
end
