class WelcomeController < ApplicationController
  def index
    @question = Question.new
    @questions = Question.all
    @article= Article.new
    @diego = LawyerProfile.find(19)
    
    
  end
  
end
