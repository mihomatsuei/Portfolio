class ChangeDataExpertPeriodToUsers < ActiveRecord::Migration[5.2]
  def change
  change_column :users, :expert_period, :string
  end

end
