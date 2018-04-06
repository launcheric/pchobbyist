class CreateVideoCards < ActiveRecord::Migration[5.1]
  def change
    create_table :video_cards do |t|
      t.string :name, null: false
      t.string :manufacturer, null: false
      t.string :interface, null: false
      t.string :chipset, null: false
      t.string :memory_size, null: false
      t.string :memory_type, null: false
      t.string :core_clock, null: false
      t.string :boost_clock
      t.string :thermal_design_power, null: false


      t.timestamps
    end
  end
end
