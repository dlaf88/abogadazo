class WelcomeController < ApplicationController
  def index
    
    @question = Question.new
    @questions = Question.last(3)
    @article= Article.new
    
  end
  def maps
    render :layout => false     
  end 
  def show
    
    session.delete(:lawyer_lead) if session[:lawyer_lead] #clear hash from apply
    @lawyers = Lawyer.last(3)
    @question = Question.new
    @questions = Question.last(3)
    @article= Article.new
    
    
  end 
  def apply 
    
  end 
  
end
