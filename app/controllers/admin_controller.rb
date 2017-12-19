class AdminController < ApplicationController

    http_basic_authenticate_with name: "user", password: "password", except: []

        def new
          @admin = Article.new
        end

        def index
          @admins = Article.all
        end

        def show
          @admin = Article.find(params[:id])
          @comments = @admin.comments.all
        end

        def edit
          @article = Article.find(params[:id])
        end

        def update
          @article = Article.find(params[:id])

          if @article.update(article_params)
            redirect_to @article
          else
            render 'edit'
          end
        end

        def destroy
          @article = Article.find(params[:id])
          @article.destroy

          redirect_to articles_path
        end

        def create
          #render plain: params[:article].inspect

          #@article = Article.new(params.require(:article).permit(:title,:text))
          @article = Article.new(article_params)
          #@article.save
          #redirect_to @article

          if @article.save
            redirect_to admin_path(@article)
          else
            render 'new'
          end
        end

        private
          def article_params
            params.require(:article).permit(:title,:text)
          end

end
