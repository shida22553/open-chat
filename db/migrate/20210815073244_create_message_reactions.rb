class CreateMessageReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :message_reactions do |t|
      t.string :user_id
      t.string :user_name
      t.references :message, null: false, foreign_key: true
      t.references :reaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
