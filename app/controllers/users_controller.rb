class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]

  def index
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end
  
  def destroy
    @user.destroy
    redirect_to users_path
  end
  
  def update
  	@user = User.find_by_id(params[:id])
	if @user.update_attributes(user_params)
		redirect_to users_path
	else
		render 'edit'
	end
  end

  def user_params
    params.require(:user).permit(:advisor_first_name, :advisor_last_name, :advisor_phone, :advisor_mobile, :admin, :manager, :support, :email, :password, :password_confirmation)
  end
  
end