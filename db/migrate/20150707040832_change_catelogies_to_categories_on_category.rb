class ChangeCatelogiesToCategoriesOnCategory < ActiveRecord::Migration
  def change
  	   rename_table	:catelogies, :categories
  end
end
