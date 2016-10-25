class ArticlesController < ApplicationController
  before_action :authenticate_admin, only: [:edit,:create,:new,:update]
  def new
    @article = Article.new
  end 
  
  def show    
    @article = Article.find(params[:id])
    @title = @article.title
    @articles = Article.where(id: [22,19,35,34])
  end 
  
  def create
    @article = Article.new(articles_params)
    
    if @article.save
      redirect_to @article 
    else
      flash[:error] = "Error creating Article. Please try again."
       render :new
    end      
  end 
  def edit
    @article = Article.find(params[:id])
  end 
  def update
    @article = Article.find(params[:id])
    if @article.update(articles_params)
      redirect_to @article, notice: 'Article was successfully updated.' 
        
      else
        render :edit 
        
      end
  end 
  
  def index
    @articles = Article.limit(3)
  end 
  private
  def articles_params
    params.require(:article).permit(:title, :body, :author,:about,:image,:image_body_field,:image_body_boo,:video,:video_field)
  end 
end
