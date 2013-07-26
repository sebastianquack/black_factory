class AddMainImageToChallengeAndDesign < ActiveRecord::Migration
  def change
		add_column :challenges, :main_image_id, :integer
		add_column :designs, :main_image_id, :integer
  end
end
