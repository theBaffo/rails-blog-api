class CommentsController < ApplicationController
  before_action :set_article, only: [:index, :create]
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /articles/{article_id}/comments
  def index
    @comments = @article.comments

    render json: @comments
  end

  # GET /articles/{article_id}/comments/1
  def show
    render json: @comment
  end

  # POST /articles/{article_id}/comments
  def create
    @comment = @article.comments.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: [@article, @comment]
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/{article_id}/comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/{article_id}rai/comments/1
  def destroy
    @comment.destroy
  end

  private
    def set_article
      @article = Article.find(params[:article_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @article = Article.find(params[:article_id])
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
