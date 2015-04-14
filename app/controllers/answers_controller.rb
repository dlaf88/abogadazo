class AnswersController < ApplicationController
  def new 
    @answer = Answer.new
  end 
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(params.require(:answer).permit(:description))
    if @answer.save
      flash[:notice] = "Answer was saved successfully."
      redirect_to @question
    else
      flash[:error] = "Error creating answer. Please try again."
      
    end
    
  end 
end
