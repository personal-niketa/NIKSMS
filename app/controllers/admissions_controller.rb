class AdmissionsController < ApplicationController

  layout "dashboard"

  def index
    @batch = Batch.find_by(id: params[:batch_id])
    @class_section = ClassSection.find_by_id(params[:class_section_id])
    @admissions = Admission.where(class_section_id: @class_section.id, batch_id: @batch.id)
    respond_to do |format|
      format.js
    end
  end

  def new
    @school_class = SchoolClass.find_by_id(params[:school_class_id])
    @admission = Admission.new
    @batch = Batch.find_by(id: params[:batch_id])
    @class_section = ClassSection.find_by_id(params[:class_section_id])
  end

  def create
    student = Student.create(admission_params[:student])
    admission = Admission.new(admission_params.except(:student))
    admission.batch_id = params[:batch_id]
    admission.class_section_id = params[:class_section_id]
    admission.student_id = student.id
    if admission.save!
      flash[:success] = "Admission done successfully."
    else
      flash[:danger] = "Something went wrong."  
    end
    redirect_to batch_path(id: params[:batch_id])
  end

  def destroy
    @batch = Batch.find_by(id: params[:batch_id])
    @class_section = ClassSection.find_by_id(params[:class_section_id])
    @admissions = Admission.where(class_section_id: @class_section.id, batch_id: @batch.id)
    admission = Admission.find_by(id: params[:id])
    if admission.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  def edit
    @admission = Admission.find_by(id: params[:id])
  end

  def update
    @admission = Admission.find_by(id: params[:id])
    if @admission.update_attributes(admission_params.except(:student))
      student = @admission.student
      student.update_attributes(admission_params[:student])
      flash[:success] = "Sucessfully updated!!"
    else
      flash[:error] = "Sorry! Something went wrong. Please contact support."
    end
    redirect_to batch_path(id: @admission.batch_id)
  end

  private

  def admission_params
    params.require(:admission).permit(:roll_no, student: [:name, :email, :gender, :dob, :father_name,
      :mother_name, :contact_no, :address, :country])
  end


end