class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant

  # GET /comments/new
  def new
    if (@restaurant == nil)
      respond_to do |format|
        format.html { redirect_to restaurants_url, notice: "Please select a restaurant to comment on." }
      end

      return
    end
    
    @comment = Comment.new()
  end

  # POST /comments or /comments.json
  def create
    if (@restaurant == nil)
      respond_to do |format|
        format.html { redirect_to restaurants_url, notice: "Please select a restaurant to comment on." }
      end
      
      return
    end

    params[:comment].merge!({restaurant_id: @restaurant.id, user_id: current_user.id})
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to restaurant_url(@comment.restaurant), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :user_id, :restaurant_id)
    end

    def set_restaurant
      session[:restaurant_id] = params[:restaurant_id] || session[:restaurant_id]
      @restaurant = Restaurant.find(session[:restaurant_id])
    rescue
      @restaurant = nil
    end
end
