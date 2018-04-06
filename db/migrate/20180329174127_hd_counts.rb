class HdCounts < ActiveRecord::Migration[5.1]
  def change
    create_table :hd_counts do |t|
      t.integer :hard_drive_id, null: false
      t.integer :build_id, null: false

      t.timestamps
    end
  end
end
