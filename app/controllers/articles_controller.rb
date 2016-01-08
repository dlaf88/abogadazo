class ArticlesController < ApplicationController
 
  def new
    @article = Article.new
  end 
  
  def show
    
    @article = Article.find(params[:id])
    @title = @article.title
    
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
  end 
  def update
    if @law_category.update(articles_params)
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
    params.require(:article).permit(:title, :body, :author,:image,:image_body_field,:image_body_boo,:video,:video_field)
  end 
end
