class RenameTileToTitleInProducts < ActiveRecord::Migration
  def up
  	rename_column :products, :tile, :title
  end

  def down
  	rename_column :products, :title, :tile
  end
end
