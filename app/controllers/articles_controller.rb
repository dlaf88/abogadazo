class ArticlesController < ApplicationController
 
  def new
    @article = Article.new
  end 
  
  def show
    @article = Article.find(params[:id])
  end 
  
  def create
    @article = Article.new(params.require(:article).permit(:title, :body, :author,:image))
    
    if @article.save
      redirect_to @article 
    else
      flash[:error] = "Error creating Article. Please try again."
       render :new
    end
      
  end 
  
end
