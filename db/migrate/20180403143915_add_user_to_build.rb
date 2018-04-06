class AddUserToBuild < ActiveRecord::Migration[5.1]
  def change
    add_column :builds, :user_id, :integer
  end
end
