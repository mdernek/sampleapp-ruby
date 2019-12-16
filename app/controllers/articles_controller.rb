class ArticlesController < ApplicationController
    before_action :require_login
    layout "application_admin"

    def new
        @article = Article.new
    end

    def index
        @articles = Article.order('updated_at DESC')
    end
    
    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article  = Article.new(article_params)

        if @article.save
            redirect_to @article
        else 
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end

    def show
        @article = Article.find(params[:id])
    end

    def article_detail
        @article = Article.find(params[:id])
        render layout: "application"
    end

    private
        def article_params
            params[:article].permit(:title, :text)
        end

        def require_login
            if cookies.encrypted[:email].blank?
                redirect_to login_users_path
            end
        end

end
