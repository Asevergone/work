class ArticlesController < ApplicationController
	def new
		@article=Article.new
	end
	def create
		
		@article=Article.new(article_params)
		@article.user_name=session[:name]
		@article.read_count=0
		if  @article.abstract==''
			@article.abstract=@article.body
        end
		if @article.save
			redirect_to @article
		else
     	render 'new'
     end
	end
	def findtitle
		@article=Article.where(title:article_params[:title])
		@comments=Comment.all
		@article.each do |article|
         article.comments_num=0
        @comments.each do |comment|
          if comment.article_id==article.id
            article.comments_num+=1
          end
        end
      end
	end
	def finduser
		@article=Article.where(user_name:article_params[:user_name])
		@comments=Comment.all
        @article.each do |article|
         article.comments_num=0
        @comments.each do |comment|
          if comment.article_id==article.id
            article.comments_num+=1
          end
        end
      end
	end
	 def article_params
  params.require(:article).permit(:title, :body, :abstract,:user_name,:read_count)
     end
    def article
    end
    def show
    @article=Article.find(params[:id])
    @article.read_count+=1
    @article.save
    @comment=Comment.where(article_id:params[:id])
    session[:title]=@article.title
    session[:id]=@article.id
    end
    def find
    end
    def findbytitle
    end
    def findbyuser
    end
end
