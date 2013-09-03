class AddWinnerDesignToChallenge < ActiveRecord::Migration
  def change
  	add_column :challenges, :winner_design_id, :integer
  end
end
