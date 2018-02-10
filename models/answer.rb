class Answer < ActiveRecord::Base 
	belongs_to :question
	# validates : user_id must not be null/login show
end

