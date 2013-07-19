class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.string :name
      t.text :description
      t.integer :challenge_id

      t.timestamps
    end
  end
end
