class CreateCases < ActiveRecord::Migration[5.1]
  def change
    create_table :cases do |t|
      t.string :name, null: false
      t.string :manufacturer, null: false
      t.string :case_type, null: false
      t.string :power_supply, null: false
      t.string :small_bay, null: false
      t.string :medium_bay, null: false
      t.string :compatibility, null: false

      t.timestamps
    end
  end
end
