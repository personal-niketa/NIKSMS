class UsersController < ApplicationController
  layout "application"
  layout :resolve_layout
  
  def registration
    user = User.new(registration_params)
    create_school_for_user(user)
    if user.save
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
    params.require(:user).permit(:email, :first_name, :last_name)
  end

  def resolve_layout
    case action_name
    when "edit"
      "dashboard"
    else
      "application"
    end
  end

end
