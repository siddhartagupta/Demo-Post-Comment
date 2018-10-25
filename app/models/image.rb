class Image < ApplicationRecord
	has_many :image_comment
	belongs_to :user
	has_attached_file :image
	validates_attachment :image,
 content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

end
