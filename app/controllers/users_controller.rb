class UsersController < ApplicationController

  def new
  end

  def create
    # user_params[:email] = user_params[:email].downcase.strip
    puts " Hi this funct"
    puts user_params
    @user = User.new(user_params)
    puts "Helloe #{@user}"
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  

end
