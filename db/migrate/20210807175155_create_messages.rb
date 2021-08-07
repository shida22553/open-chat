class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :room, null: false, foreign_key: true
      t.string :user_name
      t.string :user_id
      t.text :content
      t.integer :type

      t.timestamps
    end
  end
end
