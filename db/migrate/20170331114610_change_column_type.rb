class ChangeColumnType < ActiveRecord::Migration
  
  def change
  	change_column :order_items, :quantity, :integer
  end

end
