class ChangeMessageTypeColumnNameToContentType < ActiveRecord::Migration[6.1]
  def up
    rename_column :messages, :type, :content_type
  end

  def down
    rename_column :messages, :content_type, :type
  end
end
