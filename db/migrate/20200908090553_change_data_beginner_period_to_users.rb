class ChangeDataBeginnerPeriodToUsers < ActiveRecord::Migration[5.2]
  def change
  change_column :users, :beginner_period, :string
  end
end
