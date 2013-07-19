class CreateUsernameCookies < ActiveRecord::Migration
  def change
    create_table :username_cookies do |t|
      t.string :hash
      t.string :username

      t.timestamps
    end
  end
end
