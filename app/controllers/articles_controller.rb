class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy, :show]
  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article Successfully Updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  def create
    @article = Article.new(article_params)

    if @article.save
    #@article.save
      flash[:success] = "Articles was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

def show
end

def destroy
  @article.destroy
  flash[:danger] = 'Articles was deleted'
  redirect_to articles_path

end

private

  # White list articles
  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
