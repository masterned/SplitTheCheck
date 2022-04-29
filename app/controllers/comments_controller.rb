class CommentsController < ApplicationController
  before_action :authenticate_user!

  # GET /comments/new
  def new
    @comment = Comment.new(restaurant_id: params[:restaurant_id], user_id: params[:user_id])
    @restaurant = @comment.restaurant
  end

  # POST /comments or /comments.json
  def create
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
end
