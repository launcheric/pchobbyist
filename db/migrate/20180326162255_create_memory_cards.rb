class CreateMemoryCards < ActiveRecord::Migration[5.1]
  def change
    create_table :memory_cards do |t|
      t.string :name, null: false
      t.string :manufacturer, null: false
      t.string :type, null: false
      t.string :speed, null: false
      t.string :size, null: false
      t.string :cas_latency, null: false
      t.string :voltage, null: false
      t.string :ecc, null: false
      t.string :registered, null: false

      t.timestamps
    end
  end
end
