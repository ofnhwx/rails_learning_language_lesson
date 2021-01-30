class ChangeLabelToNameToAllTables < ActiveRecord::Migration[6.1]
  def change
    rename_column :languages, :label, :name
    rename_column :products, :label, :name
  end
end
