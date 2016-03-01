class Topic < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, styles: {
							    thumb: '300x200',
							   	full: '600x400>'
							  	}
	validates_attachment :image, presence: true,
  						  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
  						  size: { in: 0..3.megabytes }
  	validates :title, presence: true, length: {maximum: 50}
end
