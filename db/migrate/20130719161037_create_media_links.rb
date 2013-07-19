class CreateMediaLinks < ActiveRecord::Migration
  def change
    create_table :media_links do |t|
      t.integer :challenge_id
      t.integer :design_id
      t.string :url
      t.string :ip

      t.timestamps
    end
  end
end
