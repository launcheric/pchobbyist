class CreateHardDrives < ActiveRecord::Migration[5.1]
  def change
    create_table :hard_drives do |t|
      t.string :name, null: false
      t.string :manufacturer, null: false
      t.string :hdd_type, null: false
      t.string :capacity, null: false
      t.string :interface, null: false
      t.string :cache, null: false
      t.string :rpm, null: false
      t.string :form_factor, null: false

      t.timestamps
    end
  end
end
