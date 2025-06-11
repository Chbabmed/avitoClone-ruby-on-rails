require "test_helper"

class AnnoncementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @annoncement = annoncements(:one)
  end

  test "should get index" do
    get annoncements_url
    assert_response :success
  end

  test "should get new" do
    get new_annoncement_url
    assert_response :success
  end

  test "should create annoncement" do
    assert_difference("Annoncement.count") do
      post annoncements_url, params: { annoncement: { category_id: @annoncement.category_id, description: @annoncement.description, location: @annoncement.location, price: @annoncement.price, title: @annoncement.title, type: @annoncement.type, user_id: @annoncement.user_id } }
    end

    assert_redirected_to annoncement_url(Annoncement.last)
  end

  test "should show annoncement" do
    get annoncement_url(@annoncement)
    assert_response :success
  end

  test "should get edit" do
    get edit_annoncement_url(@annoncement)
    assert_response :success
  end

  test "should update annoncement" do
    patch annoncement_url(@annoncement), params: { annoncement: { category_id: @annoncement.category_id, description: @annoncement.description, location: @annoncement.location, price: @annoncement.price, title: @annoncement.title, type: @annoncement.type, user_id: @annoncement.user_id } }
    assert_redirected_to annoncement_url(@annoncement)
  end

  test "should destroy annoncement" do
    assert_difference("Annoncement.count", -1) do
      delete annoncement_url(@annoncement)
    end

    assert_redirected_to annoncements_url
  end
end
