class SchoolClassesController < ApplicationController
  layout "dashboard"

  def index
    @school_classes = SchoolClass.where(school_id: current_user.school_id)
  end

  def destroy
    @school_class = SchoolClass.find_by(id: params[:id])
    if @school_class.destroy
      flash[:danger] = "Class has been deleted successfully."
    end
    redirect_to school_classes_path
  end

  def new
    @school_class = SchoolClass.new
  end

  def create
    school_class = SchoolClass.new(schoolclass_params)
    school_class.school_id = current_user.school.id
    if school_class.save!
      flash[:success] = "class Added successfully."
    else
      flash[:danger] = "Something went wrong."  
    end
    redirect_to school_classes_path
  end

  private

  def schoolclass_params
    params.require(:school_class).permit(:class_name)
  end

end
