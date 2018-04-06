class MemoryCounts < ActiveRecord::Migration[5.1]
  def change
    create_table :memory_counts do |t|
      t.integer :memory_card_id, null: false
      t.integer :build_id, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
