class ChangeTableNameCaseToComputerCase < ActiveRecord::Migration[5.1]
  def change
    rename_table :cases, :computer_cases
  end
end
