class QuestionsController < ApplicationController
  
  def index
    @questions=Question.all
  end 
  
  def new 
    @question = Question.new
  end 
  
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @title = 'Pregunta a Abogadazo'
  end 
  
  def edit 
    @question = Question.find(params[:id])
  end
  
  def create
    @question = Question.new(params.require(:question).permit(:title, :description, :phone))
    if request.location != nil
      @question.ipaddress = request.location.city.to_s
    else
    @question.ipaddress = request.remote_ip.to_s
    end 
    if @question.save
      redirect_to @question, notice: "Question was saved successfully."
    else
      flash[:error] = "Error creating question. Please try again."
       render :new
    end
      
  end 
  
  def update
  end 
  
  
  
  
  
end
