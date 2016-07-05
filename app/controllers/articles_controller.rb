class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :update, :destroy, :new, :edit, :show]
  
  def index
    @articles= Article.all
  end

  def show
    @article = Article.find(params[:id])
    @commentt = Comment.find_by(params[:article_id])
    UserMailer.welcome_email('kuz-kol@mail.ru').deliver_now
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render action: 'edit'
    end
  end

  def new 
    
  end

  def create
    @article = Article.new(article_params)
    if @article.valid?
      @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private


  def article_params
    params.require(:article).permit(:title, :text)
  end

end
