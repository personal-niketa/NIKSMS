class ClassSectionsController < ApplicationController
  layout "dashboard"
  before_action :set_school_class, only: [:index, :new, :create, :destroy, :edit, :update]

  def index
    @class_sections = ClassSection.where(school_class_id: @school_class.id)
  end

  def new
    @class_section = ClassSection.new
  end

  def create
    class_section = ClassSection.new(class_section_params)
    class_section.school_class_id = @school_class.id
    if class_section.save!
      flash[:success] = "Section Added successfully."
    else
      flash[:danger] = "Something went wrong."  
    end
    redirect_to class_sections_path(school_class_id: @school_class.id)
  end

  def destroy
    @class_section = ClassSection.find_by(id: params[:id])
    if @class_section.destroy
      flash[:danger] = "Section has been deleted successfully."
    end
    redirect_to class_sections_path(school_class_id: @school_class.id)
  end

  def edit
    @class_section = ClassSection.find_by(id: params[:id])
  end

  def update
    class_section = ClassSection.find_by(id: params[:id])
    class_section.school_class_id = @school_class.id
    if class_section.update_attributes(class_section_params)
      flash[:success] = " Class Section Sucessfully updated!!"
    else
      flash[:error] = "Sorry! Something went wrong. Please contact support."
    end
    redirect_to class_sections_path(school_class_id: @school_class.id)
  end

  private

  def class_section_params
    params.require(:class_section).permit(:section_name, :description, :capacity)
  end

  def set_school_class
    @school_class = SchoolClass.find_by_id(params[:school_class_id])
  end

end
