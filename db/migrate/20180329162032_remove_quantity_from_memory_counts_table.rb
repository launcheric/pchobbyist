class RemoveQuantityFromMemoryCountsTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :memory_counts, :quantity
  end
end
