class AttorneyPolicy < ApplicationPolicy 
	
	attr_reader :user, :post

	def initialize(user, post)
		@user = user
		@post = post
	end

	def new?
		if user
			user.sudo?
		else 
			false
		end 
	end 

	def edit?
		new?
	end 

	def update?
		edit?
	end 

	def create?
		update?
	end 

end