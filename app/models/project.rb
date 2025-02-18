class Project < ApplicationRecord
	has_many :comments, dependent: :destroy

	# Enum for status
  	enum status: [:active, :inactive]


  	# Method to add a comment to the project
  	def add_comment(content)
    	comment = comments.create(content: content)

    	print(comment.errors.inspect)
  	end

  	def delete_comment()
    	comment.destroy
  	end

  	# Method to change the status of the project and track it
  	def change_status(new_status)
    	self.status = new_status.downcase.to_sym
    	save
    end

    def status_active?
   		status.to_sym == :active
   	end
end
