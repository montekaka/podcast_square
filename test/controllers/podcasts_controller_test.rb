require 'test_helper'

class PodcastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @podcast = podcasts(:one)
  end

  test "should get index" do
    get podcasts_url, as: :json
    assert_response :success
  end

  test "should create podcast" do
    assert_difference('Podcast.count') do
      post podcasts_url, params: { podcast: { email: @podcast.email, itunes_id: @podcast.itunes_id, name: @podcast.name, rss_feed: @podcast.rss_feed } }, as: :json
    end

    assert_response 201
  end

  test "should show podcast" do
    get podcast_url(@podcast), as: :json
    assert_response :success
  end

  test "should update podcast" do
    patch podcast_url(@podcast), params: { podcast: { email: @podcast.email, itunes_id: @podcast.itunes_id, name: @podcast.name, rss_feed: @podcast.rss_feed } }, as: :json
    assert_response 200
  end

  test "should destroy podcast" do
    assert_difference('Podcast.count', -1) do
      delete podcast_url(@podcast), as: :json
    end

    assert_response 204
  end
end
