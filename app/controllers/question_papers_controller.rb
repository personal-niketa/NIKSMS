class QuestionPapersController < ApplicationController

  layout "dashboard"

  def index
    @exam = Exam.find_by(id: params[:id])
    @questions = @exam.question_papers
  end

  def new
    @exam = Exam.find_by_id(params[:exam_id])
    @que = QuestionPaper.new
  end

  def create
    que = QuestionPaper.new(que_params)
    que.exam_id = Exam.find_by(id: params[:exam_id]).id
    if que.save!
      flash[:success] = "Question Added successfully."
    else
      flash[:danger] = "Something went wrong."  
    end
    redirect_to question_papers_path(id: params[:exam_id])
  end

  private

  def que_params
    params.require(:question_paper).permit(:question)
  end

end
