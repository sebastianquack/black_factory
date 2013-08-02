class AddScoreToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :score, :float
  end
end
