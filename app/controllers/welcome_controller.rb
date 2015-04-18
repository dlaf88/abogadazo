class WelcomeController < ApplicationController
  def index
    @question = Question.new
    @questions = Question.all
    
    
  end
  
end
