class ChangeNameOnMotherboardTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :motherboards, :maimum_memory, :maximum_memory
  end
end
