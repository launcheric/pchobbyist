class CreateCpuCoolers < ActiveRecord::Migration[5.1]
  def change
    create_table :cpu_coolers do |t|
      t.string :name, null: false
      t.string :manufacturer, null: false
      t.string :supported_sockets, null: false
      t.string :liquid_cooler, null: false
      t.string :bearing_type
      t.string :noise_level
      t.string :fan_rpm
      t.string :height
      t.string :radiator_size

      t.timestamps
    end
  end
end
