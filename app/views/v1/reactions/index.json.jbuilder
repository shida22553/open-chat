json.array! @reactions do |reaction|
  json.partial! 'reaction', reaction: reaction
end
