class AddDefaultImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :default_image, :integer
  end
end
