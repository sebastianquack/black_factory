class AddUploadHashToImage < ActiveRecord::Migration
  def change
		add_column :images, :upload_hash, :string
  end
end
