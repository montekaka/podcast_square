require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review = reviews(:one)
  end

  test "should get index" do
    get reviews_url, as: :json
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post reviews_url, params: { review: { author: @review.author, content: @review.content, country_code: @review.country_code, float: @review.float, rating: @review.rating, review_itunes_id: @review.review_itunes_id, string: @review.string, string: @review.string, string: @review.string, string: @review.string, text: @review.text, title: @review.title } }, as: :json
    end

    assert_response 201
  end

  test "should show review" do
    get review_url(@review), as: :json
    assert_response :success
  end

  test "should update review" do
    patch review_url(@review), params: { review: { author: @review.author, content: @review.content, country_code: @review.country_code, float: @review.float, rating: @review.rating, review_itunes_id: @review.review_itunes_id, string: @review.string, string: @review.string, string: @review.string, string: @review.string, text: @review.text, title: @review.title } }, as: :json
    assert_response 200
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete review_url(@review), as: :json
    end

    assert_response 204
  end
end
