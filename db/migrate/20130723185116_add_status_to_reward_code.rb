class AddStatusToRewardCode < ActiveRecord::Migration
  def change
		add_column :reward_codes, :status, :integer, default: 0
  end
end
