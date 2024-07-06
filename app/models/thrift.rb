class Thrift < ApplicationRecord
	has_many_attached :images
	has_many :posts
	geocoded_by :address
	

end
