class CreateNetworkCards < ActiveRecord::Migration[5.1]
  def change
    create_table :network_cards do |t|
      t.string :name, null: false
      t.string :manufacturer, null: false
      t.string :interface, null: false
      t.string :protocols, null: false
      t.string :security, null: false

      t.timestamps
    end
  end
end
