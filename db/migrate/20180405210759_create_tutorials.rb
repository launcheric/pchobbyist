class CreateTutorials < ActiveRecord::Migration[5.1]
  def change
    create_table :tutorials do |t|
      t.string :name, null: false
      t.string :url, null: false
      
      t.timestamps
    end
  end
end
