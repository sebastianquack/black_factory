class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :challenge_id
      t.integer :design_id
      t.string :ip

      t.timestamps
    end
  end
end
