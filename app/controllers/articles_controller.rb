class ArticlesController < ApplicationController
  def index
    matching_articles = Article.all

    @list_of_articles = matching_articles.order({ :created_at => :desc })

    render({ :template => "articles/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_articles = Article.where({ :id => the_id })

    @the_article = matching_articles.at(0)

    render({ :template => "articles/show.html.erb" })
  end

  def create
    the_article = Article.new
    the_article.title = params.fetch("query_title")
    the_article.date = params.fetch("query_date")
    the_article.blurb = params.fetch("query_blurb")
    the_article.author_id = params.fetch("query_author_id")
    the_article.pub_id = params.fetch("query_pub_id")

    if the_article.valid?
      the_article.save
      redirect_to("/articles", { :notice => "Article created successfully." })
    else
      redirect_to("/articles", { :notice => "Article failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_article = Article.where({ :id => the_id }).at(0)

    the_article.title = params.fetch("query_title")
    the_article.date = params.fetch("query_date")
    the_article.blurb = params.fetch("query_blurb")
    the_article.author_id = params.fetch("query_author_id")
    the_article.pub_id = params.fetch("query_pub_id")

    if the_article.valid?
      the_article.save
      redirect_to("/articles/#{the_article.id}", { :notice => "Article updated successfully."} )
    else
      redirect_to("/articles/#{the_article.id}", { :alert => "Article failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_article = Article.where({ :id => the_id }).at(0)

    the_article.destroy

    redirect_to("/articles", { :notice => "Article deleted successfully."} )
  end
end
