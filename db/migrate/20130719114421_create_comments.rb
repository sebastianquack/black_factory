class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :design_id
      t.string :username
      t.string :ip

      t.timestamps
    end
  end
end
