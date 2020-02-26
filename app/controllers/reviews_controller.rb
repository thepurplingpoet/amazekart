class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  
  def show
  end

  
  def new
    @review = Review.new
    @product_id = product_params[:product_id].to_i
  end

  def edit
    @product_id = @review.product_id
  end

  
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to product_path(@review.product_id), notice: 'Review was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  
  def update
    
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to product_path(@review.product_id), notice: 'Review was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  
  def destroy
    product_id = @review.product_id
    @review.destroy
    respond_to do |format|
      format.html { redirect_to product_path(product_id), notice: 'Review deleted' }
    end
  end

  private
    
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:user_id, :product_id, :rating, :review)
    end

    def product_params
      params.require(:review_params).permit(:product_id)
    end
end
