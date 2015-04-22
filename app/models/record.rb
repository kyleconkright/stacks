class Record < ActiveRecord::Base
	mount_uploader :cover, CoverImageUploader
	has_and_belongs_to_many :lists
	has_many :users, through: :lists

	validates :artist, presence: true
	validates :title, presence: true
end