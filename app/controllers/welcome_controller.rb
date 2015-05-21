class WelcomeController < ApplicationController
  def index
    @question = Question.new
    @questions = Question.limit(3)
    @article= Article.new
    
    
    
  end
  
end
