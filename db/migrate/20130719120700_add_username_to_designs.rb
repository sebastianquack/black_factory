class AddUsernameToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :username, :string
  end
end
