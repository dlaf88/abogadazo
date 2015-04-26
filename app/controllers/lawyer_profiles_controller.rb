class LawyerProfilesController < ApplicationController
  def new
    @lawyerprofile = LawyerProfile.new
    @lawyer = Lawyer.find(params[:lawyer_id])
    if @lawyer.lawyer_profile
      redirect_to root_path, notice: "You already have a profile."
    end 
  end 
  def create
    @lawyer = Lawyer.find(params[:lawyer_id])
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
    @lawyer = Lawyer.find(params[:lawyer_id])
    @lawyerprofile = @lawyer.lawyer_profile
  end 
    
    
end
