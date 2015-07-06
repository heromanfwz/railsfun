class RenameDesriptionToDescriptionInProducts < ActiveRecord::Migration
  def up
  	rename_column :products, :desription, :description 
  end

  def down
  	rename_column :products, :description, :desription 
  end
end
