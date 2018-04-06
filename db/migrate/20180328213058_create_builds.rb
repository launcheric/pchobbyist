class CreateBuilds < ActiveRecord::Migration[5.1]
  def change
    create_table :builds do |t|
      t.string  :name, null: false
      t.text    :description
      t.integer :case_id, null: false
      t.integer :cpu_cooler_id
      t.integer :cpu_id, null: false
      t.integer :motherboard_id, null: false
      t.integer :network_card_id
      t.integer :power_supply_id, null: false
      t.integer :video_card_id

      t.timestamps
    end
  end
end
