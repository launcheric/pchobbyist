class ChangeCaseIdInTableBuild < ActiveRecord::Migration[5.1]
  def change
    rename_column :builds, :case_id, :computer_case_id
  end
end
