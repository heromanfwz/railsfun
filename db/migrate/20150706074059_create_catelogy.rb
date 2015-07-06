class CreateCatelogy < ActiveRecord::Migration
  def change
    create_table :catelogies do |t|
    	t.string	:title
    	t.timestamps
    end
  end
end
