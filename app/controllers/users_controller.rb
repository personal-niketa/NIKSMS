class UsersController < ApplicationController
  # layout "application"
  layout :resolve_layout
  
  def registration
    user = User.new(registration_params)
    create_school_for_user(user)
    if user.save
      user.add_role :admin
      flash[:success] = "Sucessfully Registered!!"
    else
      flash[:error] = "Sorry! Something went wrong. Please contact support."
    end
    redirect_to root_path
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Sucessfully updated!!"
    else
      flash[:error] = "Sorry! Something went wrong. Please contact support."
    end
    redirect_to school_path(id: @user.school_id)
  end

  def new
    @user = User.new
  end

  def create_user
    user = User.new(user_params)
    user.password = "Chetu@123"
    user.password_confirmation = "Chetu@123"
    user.school_id = current_user.school_id
    if user.save!
      user.add_role params[:user][:school_role].to_sym
      flash[:success] = "User Added successfully."
    else
      flash[:danger] = "Something went wrong."  
    end
    redirect_to users_path
  end

  def edit_password
    @user =  current_user
    
    respond_to do |format|
      format.js
    end
  end

  def update_password
    @user =  current_user
    if @user.update_attributes(password_params)
      bypass_sign_in(@user)
      flash[:success] = "Sucessfully updated!!"
    else
      flash[:error] = "Sorry! Something went wrong. Please contact support."
    end
    redirect_to root_path
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      flash[:danger] = "User has been deleted successfully."
    end
    redirect_to users_path
  end

  private

  def create_school_for_user(user)
    school = School.create(school_name: params[:user][:school_name])
    user.school_id = school.id
  end

  def registration_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                :phone, :password, :password_confirmation, :school_name)
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :phone, :details)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def resolve_layout
    case action_name
    when "edit", "edit_password", "index", "new"
      "dashboard"
    else
      "application"
    end
  end

end
