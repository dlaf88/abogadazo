class AttorneysController < ApplicationController

	def index
		@attorneys = Attorney.all
	end

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

	def edit
		@attorney = Attorney.find(params[:id])
	end 

	def update
		@attorney = Attorney.find(params[:id])
    if @attorney.update(attorney_params)
     	 redirect_to @attorney, notice: 'Attorney was successfully updated.' 
        
      else
        render :edit 
        
      end
		
	end 


	private

	def attorney_params
		params.require(:attorney).permit(:first_name,:middle_name,:last_name,:contact_email,:phone_number,:profile_photo, :firm_id)
	end 

end 
