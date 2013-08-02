class RenameDesignVotesColumn < ActiveRecord::Migration
  def change
    rename_column :designs, :votes, :vote_count
  end
end