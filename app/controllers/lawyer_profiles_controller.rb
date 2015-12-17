class LawyerProfilesController < ApplicationController
  before_filter :authenticate_account!, :only => [:new,:create]
  before_filter :authenticate_attorney, :only => [:update,:delete]
 
  def new    
    if current_account.lawyer_profile # checks to see if you already have a profile path
      redirect_to lawyer_profile_path(current_account.lawyer_profile.id)
    else 
    @lawyerprofile = LawyerProfile.new(:name => current_account.first_name.to_s + " "+current_account.last_name.to_s )
    @lawyer = current_account
    end
  end 
  def create
    @lawyer = current_account
    @lawyer.type = 'Attorney'
    @lawyerprofile = LawyerProfile.new(params.require(:lawyer_profile).permit(:name,:address,:state,:body,:license,:image))
    @lawyerprofile.attorney_id = @lawyer.id
    
    if @lawyerprofile.save
      @lawyer.save
      redirect_to lawyer_profile_path(@lawyerprofile), notice: "Profile was saved successfully."
    else
      flash[:alert] = "Error creating profile. Please try again."
      render :new
    end   
    
  end 
  
  def show    
    @lawyerprofile = LawyerProfile.find(params[:id])
  end 
  
  def authenticate_attorney
    redirect_to root_path unless account_signed_in? && current_account.type == "Attorney" 
  end
end 