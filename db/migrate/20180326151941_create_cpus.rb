class CreateCpus < ActiveRecord::Migration[5.1]
  def change
    create_table :cpus do |t|
      t.string :name, null: false
      t.string :manufacturer, null: false
      t.string :data_width
      t.string :socket, null: false
      t.string :operating_frequency, null: false
      t.string :max_turbo_frequency
      t.string :cores, null: false
      t.string :lighography, null: false
      t.string :thermal_design_power, null: false
      t.string :cooler, null: false
      t.string :maximum_memory, null: false
      t.string :integrated_graphics, null: false

      t.timestamps
    end
  end
end
