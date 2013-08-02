class AddVotesToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :votes, :integer
  end
end
