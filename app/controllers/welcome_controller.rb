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
     @tags = ActsAsTaggableOn::Tag.most_used(10)
    session.delete(:lawyer_lead) if session[:lawyer_lead] #clear hash from apply
    @lawyers = Lawyer.last(3)
    @question = Question.new
    @articles = Article.last(2)
    @article= Article.new  
    render :layout => 'layouts/application'
  end 
  def apply 
    
  end 
  
end
