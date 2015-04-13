class QuestionsController < ApplicationController
  def index 
  
  end
  
  def new
    @question = Question.new
  end 
  
  def create
    if @question.save
      
    end
  end
  
  
  
end
