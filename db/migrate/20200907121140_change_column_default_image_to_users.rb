class ChangeColumnDefaultImageToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :users, :default_image, 1
  	change_column_null :users, :default_image, false
  end
end
