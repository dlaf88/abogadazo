class LawyerProfilesController < ApplicationController
  before_filter :authenticate_lawyer!, except: [:show]
 
  def new    
    @lawyerprofile = LawyerProfile.new
    @lawyer = current_lawyer
      if @lawyer.lawyer_profile
        redirect_to root_path, notice: "You already have a profile."
      end      
    
  end 
  def create
    @lawyer = current_lawyer
    @lawyerprofile = LawyerProfile.new(params.require(:lawyer_profile).permit(:name,:address,:state,:body,:license,:image))
    @lawyerprofile.lawyer = @lawyer   
    
    if @lawyerprofile.save
      redirect_to root_path, notice: "Profile was saved successfully."
    else
      flash[:alert] = "Error creating profile. Please try again."
      render :new
    end   
    
  end 
  
  def show    
    @lawyerprofile = LawyerProfile.find(params[:id])
  end 
    
    
end
