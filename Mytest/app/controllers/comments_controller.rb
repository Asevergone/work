class CommentsController < ApplicationController
	def new
		@comment=Comment.new
	end
	def show
		@comment=Comment.find(params[:id])
	end
	def create
		@comment=Comment.new(comment_params)
		@comment.user_name=session[:name]
		@comment.article_title=session[:title]
		@comment.article_id=session[:id];
		if @comment.save
			redirect_to @comment
		else
			render 'new'
		end
	end
	def comment_params
		params.require(:comment).permit(:body,:user_name,:article_title,:article_id)
	end
	def destroy
	@comment=Comment.find(params[:id])
	@comment.destroy
	redirect_to users_index_path	
	end
end
