class CoursesController < ApplicationController
  before_action :set_course, only: [:edit, :update, :destroy]
  before_action :login?, except: [:index, :show]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.build(course_params)

    if @course.save
      redirect_to courses_path, notice: "新增課程成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to courses_path, notice: "課程更新成功"
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path, notice: "課程已刪除"
  end

  private
  def set_course
    @course = current_user.courses.find(params[:id])
  end

  def login?
    # 如果沒登入，轉去登入頁面
    redirect_to sign_in_path, notice: '請先登入會員' unless user_signed_in?
  end

  def course_params
    params.require(:course).permit(:name, :price, :intro, :hour)
  end
end
