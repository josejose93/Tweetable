class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments
  def index
    @comments = Comment.where(tweet_id: params[:tweet_id])
    @comment = @tweet.comments.new
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.new(comment_params)
    # @comment.user = @tweet.user

    if @comment.save
      redirect_to @comment, notice: "Comment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: "Comment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to comments_url, notice: "Comment was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
