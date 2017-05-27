class FirmsController < ApplicationController

	def index
	end 
 
  
	def show  
	@firm = Firm.find(params[:id])
	end 

	def new  
	 @firm = Firm.new   
	end

	def create
		@firm = Firm.new(firm_params)
    
	    if @firm.save
	      redirect_to @firm
	    else
	      flash[:error] = "Error creating Firm. Please try again."
	       render :new
	    end 
	end 

	def edit
    @firm = Firm.find(params[:id])
  end 
  def update
    @firm = Firm.find(params[:id])
    if @firm.update(firm_params)
      redirect_to @firm, notice: 'Firm was successfully updated.' 
        
      else
        render :edit 
        
      end
  end
  
  private

	def firm_params
		params.require(:firm).permit(:logo,:address,:state,:office_phone,:website,:name,:description)
	end

  
end 