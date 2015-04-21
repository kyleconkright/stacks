class List < ActiveRecord::Base
	has_and_belongs_to_many :records
	belongs_to :user
end
