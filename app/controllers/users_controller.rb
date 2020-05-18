class UsersController < ApplicationController
  layout "application"
  
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

  private

  def create_school_for_user(user)
    school = School.create(school_name: params[:user][:school_name])
    user.school_id = school.id
  end

  def registration_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                :phone, :password, :password_confirmation, :school_name)
  end
end
