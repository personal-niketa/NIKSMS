class SchoolsController < ApplicationController

   layout "dashboard", only: :dashboard

  def create
    @school = School.new(school_params)
    if @school.save!
      create_admin_user_for_school
      UserMailer.welcome_email(@school.contact_email).deliver
      flash[:success] = "school registered successfully"
    else
      flash[:error] = "Sorry some issues"
    end
    redirect_to welcome_registeration_path
  end

  def dashbaord
  end

  private
  def school_params
    params.permit(:person_name, :school_name, :contact_email, :contact_number)
  end

  def create_admin_user_for_school
    user = User.create(name: '', email: @school.contact_email, password: '123456789', password_confirmation: '123456789')
    user.add_role 'admin'
  end
  
end