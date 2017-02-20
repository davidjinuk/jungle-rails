class ReviewsController < ApplicationController
  
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to :back, notice: 'Review created!'
    else
      redirect_to :back
    end
  end

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end