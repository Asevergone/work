class LoginController < ApplicationController
  def index
    @user=User.all
  end
  def new
  end
 def create
   @userLog= User.find_by(name: user_params[:name])
   if  @userLog && @userLog.password == user_params[:password]
  @userLog.save
  session[:name]=@userLog.name
  session[:password]=@userLog.password
  render 'show'
  else
  flash.now[:login_error] = "Invalid username or password for #{user_params[:name]}"
  render 'log'
  end
  end
  def user_params
  params.require(:user).permit(:name, :password)
  end
  def log
    @user=User.new
  end 
  def show
  end
  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to  users_view_path
  end
  def myinfo
  @myself=User.where(name:session[:name]).first
  end
end
