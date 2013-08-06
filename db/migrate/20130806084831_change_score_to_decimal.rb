class ChangeScoreToDecimal < ActiveRecord::Migration
  def up
  	change_column :designs, :score, :decimal, precision: 5, scale: 1
  end

  def down
  end
end
