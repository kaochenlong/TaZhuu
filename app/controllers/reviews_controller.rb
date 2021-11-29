class ReviewsController < ApplicationController
  before_action :authenticate!

  def create
    # 哪一門課
    course = Course.find(params[:course_id])

    review = course.reviews.build(review_params)
    review.user = current_user
    if review.save
      redirect_to course_path(course), notice: '完成評價'
      # redirect_to course, notice: '完成評價'
    else
      # ....
    end

    # render html: params
  end

  private
  def review_params
    params.require(:review).permit(:rating, :title, :content)
  end
end
