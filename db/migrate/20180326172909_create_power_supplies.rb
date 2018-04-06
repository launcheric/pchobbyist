class CreatePowerSupplies < ActiveRecord::Migration[5.1]
  def change
    create_table :power_supplies do |t|
      t.string :name, null: false
      t.string :manufacturer, null: false
      t.string :psu_type, null: false
      t.string :wattage, null: false
      t.string :modular, null: false
      t.string :efficiency_certification, null: false

      t.timestamps
    end
  end
end
