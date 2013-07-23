class AddHiddenToDesignCommentImageMediaLinkChallenge < ActiveRecord::Migration
  def change
		add_column :challenges, :hidden, :boolean, default: true
		add_column :designs, :hidden, :boolean, default: false
		add_column :comments, :hidden, :boolean, default: false
		add_column :images, :hidden, :boolean, default: false
		add_column :media_links, :hidden, :boolean, default: false  
  end
end
