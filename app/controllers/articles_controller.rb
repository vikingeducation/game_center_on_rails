class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end  

  def show
    @article = Article.find(params[:id])
  end 

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(whitelisted_params)
      redirect_to article_path(@article)
    else
      redirect_to edit_article_path
    end
  end


  def create
      
    @article = Article.new(whitelisted_params)
    if @article.save
       redirect_to article_path(@article)
    else
        render new_article_path
    end        
  end 

  private
  def whitelisted_params
   params.require(:article).permit(:title, :body)
  end   
end
