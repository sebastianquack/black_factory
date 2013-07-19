class CreateUsernameScores < ActiveRecord::Migration
  def change
    create_table :username_scores do |t|
      t.string :username
      t.integer :score

      t.timestamps
    end
  end
end
