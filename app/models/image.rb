class Image < ActiveRecord::Base
  attr_accessible :image, :challenge_id, :design_id, :ip, :hidden, :upload_hash, :description
	belongs_to :challenge
	belongs_to :design

  has_attached_file :image, 
  	:styles => { :large => "500x500", :medium => "300x300>", :thumb => "100x100>" },
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
    :url => ':s3_domain_url',
    :path => "images/:id/:style/image.:extension"  	
	
end
