class CreateVoteCookies < ActiveRecord::Migration
  def change
    create_table :vote_cookies do |t|
      t.string :cookiehash
      t.integer :design_id
      t.integer :vote
      t.string :ip

      t.timestamps
    end
  end
end
