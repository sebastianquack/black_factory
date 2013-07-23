class CreateRewardCodes < ActiveRecord::Migration
  def change
    create_table :reward_codes do |t|
      t.string :code
      t.integer :type
      t.integer :points
      t.integer :achievement_id

      t.timestamps
    end
  end
end
