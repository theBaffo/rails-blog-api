require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
    @article = Article.find(@comment.article_id)
  end

  test "should get index" do
    get article_comments_url(@article), as: :json
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post article_comments_url(@article), params: { comment: { body: @comment.body, commenter: @comment.commenter, status: @comment.status } }, as: :json
    end

    assert_response 201
  end

  test "should show comment" do
    get article_comment_url(@article, @comment), as: :json
    assert_response :success
  end

  test "should update comment" do
    patch article_comment_url(@article, @comment), params: { comment: { body: @comment.body, commenter: @comment.commenter, status: @comment.status } }, as: :json
    assert_response 200
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete article_comment_url(@article, @comment), as: :json
    end

    assert_response 204
  end
end
