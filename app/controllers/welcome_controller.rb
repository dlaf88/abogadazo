class WelcomeController < ApplicationController
  def index
    @question = Question.new
    @questions = Question.all
    @location = request.location.state
    
    
  end
  
end
