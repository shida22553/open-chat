class AddInitialReactionData < ActiveRecord::Migration[6.1]
  def up
    smile = Reaction.find_or_initialize_by(id: 1)
    smile.update!(name: 'smile')
    laugh = Reaction.find_or_initialize_by(id: 2)
    laugh.update!(name: 'laugh')
    cry = Reaction.find_or_initialize_by(id: 3)
    cry.update!(name: 'cry')
  end

  def down
    Reaction.all.destroy_all
  end
end
