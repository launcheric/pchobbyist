class CreateMotherboards < ActiveRecord::Migration[5.1]
  def change
    create_table :motherboards do |t|
      t.string :name, null: false
      t.string :manufacturer, null: false
      t.string :form_factor, null: false
      t.string :socket, null: false
      t.string :chipset, null: false
      t.string :memory_pin, null: false
      t.string :memory_slots, null: false
      t.string :memory_type, null: false
      t.string :maimum_memory, null: false
      t.string :raid_support, null: false


      t.timestamps
    end
  end
end
