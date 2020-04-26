class SchoolsController < ApplicationController

  def create
    @school = School.new(school_params)
    if @school.save!
      UserMailer.welcome_email(@school.contact_email).deliver
      flash[:success] = "school registered successfully"
    else
      flash[:error] = "Sorry some issues"
    end
    redirect_to welcome_registeration_path
  end

  private
  def school_params
    params.permit(:person_name, :school_name, :contact_email, :contact_number)
  end
  
end