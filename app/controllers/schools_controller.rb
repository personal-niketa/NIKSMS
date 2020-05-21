class SchoolsController < ApplicationController
  before_action :authenticate_user!, except: :create

  layout "dashboard"

  def dashbaord
  end

  def show
  	@school = School.find_by(id: params[:id])
  end
  
  def edit_profile
  	@school = School.find_by(id: params[:id])
  end

  def update_profile
    @school = School.find_by(id: params[:id])
    if @school.update_attributes(school_params)
      flash[:success] = "Sucessfully updated!!"
    else
      flash[:error] = "Sorry! Something went wrong. Please contact support."
    end
    redirect_to school_path(id: @school.id)
  end

  private

  def school_params
    params.require(:school).permit(:school_name, :address, :board)
  end

end