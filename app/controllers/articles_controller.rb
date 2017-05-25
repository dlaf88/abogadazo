class ArticlesController < ApplicationController
  before_action :authenticate_admin, only: [:edit,:create,:new,:update]
  respond_to :html,:json
  def new
    @article = Article.new
  end 
  
  def show    
    @article = Article.friendly.find(params[:id])
    @title = @article.title
    @articles = Article.where(id: [27,19,35,34])
    @related_articles = @article.find_related_tags.limit(2)
    #TODO refactor this code here.
    respond_with_article_or_redirect
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
    @article = Article.friendly.find(params[:id])
  end 
  def update
    @article = Article.friendly.find(params[:id])
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
    params.require(:article).permit(:title, :body, :author,:about,:image,:image_body_field,:video,:video_field,:law_category_id, :tag_list)
  end 

  def respond_with_article_or_redirect
    if request.path != article_path(@article)
      return redirect_to @article, status: :moved_permanently
    else
      return respond_with @article
    end

  end 
end
