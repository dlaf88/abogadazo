class QuestionsController < ApplicationController
  before_action :redirect_to_root, only: [:index]
  invisible_captcha only: [:create, :update], honeypot: :subtitle
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
    #@ziggeo = Ziggeo.new("0e19139aa5a50cdb9c584bdae15a2268", "a54079bb4188840a133bdd481c2f9f7f", "d2f02205414d055d3be3ed8b919e6694")
  end 
  
  def edit 
    @question = Question.find(params[:id])
  end
  
  def create
    @question = Question.new(params.require(:question).permit(:title, :description, :phone))
   #if request.location != nil
   #  @question.ipaddress = request.location.city.to_s
   # else
   # @question.ipaddress = request.remote_ip.to_s
   # end 
   respond_to do |format|
      if @question.save
        format.html{      
          AlertEmailJob.perform_later(@question.id)     
          redirect_to @question, notice: "Muchas gracias por su pregunta. Estaremos en contacto"
        }
        format.js
      else 
        format.html{
          flash[:error] = "Hubo un error. Por favor intente de nuevo."
          render :new
        }
        format.js {render :error}
      end 

    end       
    
      
  end 
  
  def update
  end 
  def redirect_to_root
    redirect_to root_path
  end 
  
  
  
  
end
