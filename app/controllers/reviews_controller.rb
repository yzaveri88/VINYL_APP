class ReviewsController < ApplicationController
  def create
    @record = Record.find(params[:record_id])
    @review = Review.new(review_params)
    @review.record = @record
    if @review.save
      redirect_to record_path(@record)
    else
      render 'records/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
