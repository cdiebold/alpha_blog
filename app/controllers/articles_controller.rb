class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)
  end
end


private

# White list articles
def article_params
  params.require(:article).permit(:title, :description)
end
