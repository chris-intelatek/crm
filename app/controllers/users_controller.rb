class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  before_action :set_user, only: [:show, :edit, :destroy, :update]

  def index
  	@users = User.all
  end

  def show
  end

  def edit
  end
  
  def destroy
    @user.destroy
    redirect_to users_path
  end
  
  def update
	  if @user.update_attributes(user_params)
		  redirect_to users_path
	  else
	  	render 'edit'
	  end
  end
  
  private
  
  def set_user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:advisor_first_name, :advisor_last_name, :advisor_phone, :advisor_mobile, :admin, :manager, :support, :email, :password, :password_confirmation, :group)
  end
  
end