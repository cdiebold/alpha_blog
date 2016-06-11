class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
  def edit
    @article = Article.find(params[:id])

  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article Successfully Updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  def create
    @article = Article.new(article_params)

    if @article.save
    #@article.save
      flash[:notice] = "Articles was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

def show
  @article = Article.find(params[:id])
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
  flash[:notice] = 'Articles was deleted'
  redirect_to articles_path

end

private

  # White list articles
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
