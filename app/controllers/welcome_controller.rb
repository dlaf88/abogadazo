class WelcomeController < ApplicationController
  def index
    @question = Question.new
    @questions = Question.all
    @article= Article.new
    
    
  end
  
end
