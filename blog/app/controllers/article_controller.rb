# frozen_string_literal: true

# #m
class ArticleController < ApplicationController
  def index
    ## DELETED for using database
    # @post1 = 'Learning Ruby on Rails'
    # @post2 = 'Kind of Programming Languages'

    # @languages = %w[rust ruby c]
    ## end DELETE for using database

    @articles = Article.all
  end

  def detail
    @article = Article.find_by(id: params[:id])
  end

  def input; end

  def create
    title_body = params[:title]
    description_body = params[:description]

    article = Article.new(title: title_body, description: description_body)

    if article.save
      flash[:msg] = 'Article successfully saved'
      redirect_to '/article'
    else
      redirect_to '/article/input'
    end
  end

  def edit
    id_params = params[:id]

    @article = Article.find_by(id: id_params)
  end

  def update
    id_params = params[:id]
    title_body = params[:title]
    description_body = params[:description]

    article = Article.find_by(id: id_params)
    update_article(article, title_body, description_body, id_params)
  end

  def update_article(article, title, description, id_params)
    if article.nil?
      redirect_to "/articles/edit/#{id_params}"
      return
    end

    article.title = title
    article.description = description

    handle_update_article(article)
  end

  def handle_update_article(article)
    if article.save
      flash[:msg] = "Article with id #{article.id} successfully updated"
      redirect_to '/article'
    else
      redirect_to "/article/edit/#{article.id}"
    end
  end

  def delete
    id_params = params[:id]

    # redirect_to "/article/detail/#{id_params}"

    article = Article.find_by(id: id_params)

    flash[:msg] = if article.destroy
                    "Article \"#{article.title}\"successfully deleted"
                  else
                    "Failed delete article \"#{article.title}\""
                  end

    redirect_to '/article'
  end
end
