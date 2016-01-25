class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end  

  def show
    @article = Article.find(params[:id])
  end 


  def create
    puts " Params : #{whitelisted_params}"
      
    @article = Article.new(whitelisted_params)
    if @article.save
       redirect_to article_path(@article)
    else
        render new_article_path
    end        
  end 

  private
  def whitelisted_params
   params.require(:articles).permit(:title, :body)
  end   
end
