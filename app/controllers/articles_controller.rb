class ArticlesController < ApplicationController
  before_action :authenticate_admin, only: [:create,:update]
  respond_to :html,:json
  def new
    @article = Article.new
    authorize @article
  end 
  
  def show  
    @question = Question.new  
    @article = Article.friendly.find(params[:id]) || Article.find(params[:id].to_i)
    @title = @article.title
    @related_articles = @article.find_related_tags.limit(2)
    #TODO refactor this code here.
    respond_with_article_or_redirect

   
  end 
  
  def create
    @article = Article.new(articles_params)  
    authorize @article  
    if @article.save
      redirect_to @article 
    else
      flash[:error] = "Error creating Article. Please try again."
       render :new
    end      
  end 
  def edit
    @article = Article.friendly.find(params[:id])
    authorize @article
  end 
  def update
    @article = Article.friendly.find(params[:id])
    authorize @article
    if @article.update(articles_params)
      redirect_to @article, notice: 'Article was successfully updated.' 
        
      else
        render :edit 
        
      end
  end 
  
  def index
    @tags = ActsAsTaggableOn::Tag.most_used(5)
    if params[:q]
      topic = params[:q]
      @articles = Article.tagged_with("#{topic}").page(params[:page]).per(3)
      @category = topic.to_s
    else 
      @articles = Article.all.page(params[:page]).per(3)
    end  
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
