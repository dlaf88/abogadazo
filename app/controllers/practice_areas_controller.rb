class PracticeAreasController < ApplicationController
  def import
   
    PracticeArea.import(params[:file])
    redirect_to root_url, notice: "Practice Areas imported"
  
  end 
end 