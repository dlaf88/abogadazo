class AnswersController < ApplicationController
  before_filter :authenticate_lawyer!
  def new 
    @answer = Answer.new
  end 
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(params.require(:answer).permit(:description))
    @answer.lawyer = current_lawyer
    if @answer.save
      flash[:notice] = "Answer was saved successfully."
      redirect_to @question
    else
      flash[:error] = "Error creating answer. Please try again."
      
    end
    
  end 
end
