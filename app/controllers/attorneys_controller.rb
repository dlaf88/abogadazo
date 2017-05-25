class AttorneysController < ApplicationController

	def show
		@attorney = Attorney.find(params[:id])
	end 

	def new 
		@attorney = Attorney.new
	end 

	def create
		@attorney = Attorney.new(attorney_params)
    
	    if @attorney.save
	      redirect_to @attorney
	    else
	      flash[:error] = "Error creating Article. Please try again."
	       render :new
	    end 
	    
	end 

	def update
		
	end 


	private

	def attorney_params
		params.require(:attorney).permit(:first_name,:middle_name,:last_name,:contact_email,:phone_number,:profile_photo)
	end 

end 
