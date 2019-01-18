class Cms::ArticlesController < ApplicationController

  def index
    @articles = Article.all
    @users = User.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to cms_articles_path, notice: "Article is successfully created."
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    if params[:role].present?
      @user = User.find(params[:id])
      @user.update_attribute(:role, params[:role])
      redirect_to cms_articles_path
    else
      @article = Article.find(params[:id])
      if @article.update(article_params)
        flash[:notice] = "Article was successfully updated."
        redirect_to cms_articles_path
      else
        render 'edit'
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to cms_articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :lede, :body, :image, :category_id, :user_id)
  end

end