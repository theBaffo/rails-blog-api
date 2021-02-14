require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  include ApiGuard::Test::ControllerHelper

  setup do
    @tokens = jwt_and_refresh_token(users(:one), 'user')
    @headers = { Authorization: 'Bearer ' + @tokens[0].to_s }

    @article = articles(:one)
  end

  test "should get index" do
    get articles_url, as: :json
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post articles_url, headers: @headers, params: { article: { body: @article.body, title: @article.title, status: @article.status } }, as: :json
    end

    assert_response 201
  end

  test "should show article" do
    get article_url(@article), as: :json
    assert_response :success
  end

  test "should update article" do
    patch article_url(@article), headers: @headers, params: { article: { body: @article.body, title: @article.title, status: @article.status } }, as: :json
    assert_response 200
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@article), headers: @headers, as: :json
    end

    assert_response 204
  end
end
