class StaticPagesController < ApplicationController
  def terms
  end 
  def apply
    session[:lawyer_lead]||= true
  end 
end
