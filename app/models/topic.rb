class Topic < ActiveRecord::Base
	has_attached_file :image, styles: {
							    thumb: '100x100>',
							   	medium: '600x400>'
							  	}
	validates_attachment :image, presence: true,
  						  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
  						  size: { in: 0..3.megabytes }
end
