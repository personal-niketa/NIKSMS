class ExamsController < ApplicationController

  layout "dashboard"

  def index
    @exams = Exam.all
  end

  def new
    @exam = Exam.new
    @school_classes = current_user.school.school_classes
    @batches = Batch.all
  end

  def create
    exam = Exam.new(exam_params)
    if exam.save!
      flash[:success] = "Exam Added successfully."
    else
      flash[:danger] = "Something went wrong."  
    end
    redirect_to exams_path
  end

  private

  def exam_params
    params.require(:exam).permit(:exam_name, :subject, :school_class_id, :batch_id)
  end
  
end