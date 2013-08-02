class UpdateVotesToCalculateScore < ActiveRecord::Migration
  def up
    Design.update_all( "score = 0, vote_count = 0" )
    VoteCookie.all.each { |v| v.save }
  end

end
