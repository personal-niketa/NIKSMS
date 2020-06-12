class BatchesController < ApplicationController
  layout "dashboard"
  skip_before_action :verify_authenticity_token, only: [:choose_school]

  def index
    @batches = Batch.all
  end

  def new
    @batch = Batch.new
  end

  def create
    batch = Batch.new(batch_params)
    if batch.save!
      flash[:success] = "Batch Added successfully."
    else
      flash[:danger] = "Something went wrong."  
    end
    redirect_to batches_path
  end

  def edit
    @batch = Batch.find_by(id: params[:id])
  end

  def update
    @batch = Batch.find_by(id: params[:id])
    if @batch.update_attributes(batch_params)
    flash[:success] = "Batch Sucessfully updated!!"
    else
      flash[:error] = "Sorry! Something went wrong. Please contact support."
    end
    redirect_to batches_path
  end

  def destroy
    @batch = Batch.find_by(id: params[:id])
    if @batch.destroy
      flash[:danger] = "Batch has been deleted successfully."
    end
    redirect_to batches_path
  end

  def show
    @batch = Batch.find_by(id: params[:id])
    @school_classes = current_user.school.school_classes
  end

  def assign_cls_teacher
    @class_teacher = ClassTeacher.new
    @cls_sec = ClassSection.find_by_id(params[:class_section_id])
    @teachers = current_user.school.users.with_role(:teacher)
  end

  def assigned_cls_teacher
    @class_teacher = ClassTeacher.new(class_teacher_params)
    @class_teacher.batch_id = params[:id]
    if @class_teacher.save!
      flash[:success] = "Sucessfully added Class Teacher !!"
    else
      flash[:error] = "Sorry! Something went wrong. Please contact support."
    end
    redirect_to batches_path
  end

  def choose_school
    @school_class = SchoolClass.find_by_id(params[:school_class])
    # @class_sections = @school_class.get_sections_by_name
    @class_sections = @school_class.class_sections.pluck(:section_name, :id)
    respond_to do |format|
      format.js
    end
  end


  private

  def batch_params
    params.require(:batch).permit(:batch_name)
  end

  def class_teacher_params
    params.require(:class_teacher).permit(:class_section_id, :user_id)
  end

  
end