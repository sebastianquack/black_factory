class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.datetime :time
      t.text :description

      t.timestamps
    end
  end
end
