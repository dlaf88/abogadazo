class WelcomeController < ApplicationController
  def index
    @question = Question.new
    @questions = Question.last(3)
    @article= Article.new
    
  end
  def show
    @lawyers = Lawyer.last(3)
    @question = Question.new
    @questions = Question.last(3)
    @article= Article.new
    
    
  end 
  
end
