  class UsersController < ApplicationController
    def new
      @user=User.new
    end
    def index
      @users=User.all
      @articles=Article.all
      @comments=Comment.all
      @articles.each do |article|
         article.comments_num=0
        @comments.each do |comment|
          if comment.article_id==article.id
            article.comments_num+=1
          end
        end
      end
      @Myself=User.where(name:session[:name]).first
    end
    def register
      @users=User.all
      @user=User.new
    end
    def create
     @user= User.new(user_params)
     @users=User.all
     if @user.save
      redirect_to @user  
    else
      render 'register'
    end
  end
  def user_params
    params.require(:user).permit(:name, :password)
  end
  def show
    @user=User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    
    if @user.update(update_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  def update_params
    params.require(:user).permit(:password)
  end
  def view
    @users=User.all
  end
  def destroy
    @user=User.find(params[:id])
    @user.destroy
  end
  def myinfo
    @article=Article.where(user_name: params[:user_name]).first
    @user=User.find_by_name @article.user_name
  end
  def quit
    if session[:name] && session[:password]
     session[:name]=nil
     session[:password]=nil
     session[:title]=nil
     session[:id]=nil
   end
 end
 def details
  @article=Article.find(params[:id])
end
end
