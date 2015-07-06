class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string	:tile
    	t.text		:desription
    	t.timestamps 
    end
  end
end
