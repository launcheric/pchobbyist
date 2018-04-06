class ChangeTableColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :memory_cards, :type, :memory_type
  end
end
