require 'test_helper'

class SaveksControllerTest < ActionController::TestCase
  setup do
    @savek = saveks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:saveks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create savek" do
    assert_difference('Savek.count') do
      post :create, savek: { avg_rating: @savek.avg_rating, first_name: @savek.first_name, gender: @savek.gender, last_name: @savek.last_name, latitude: @savek.latitude, longitude: @savek.longitude, occupation: @savek.occupation, radius: @savek.radius, ratings: @savek.ratings }
    end

    assert_redirected_to savek_path(assigns(:savek))
  end

  test "should show savek" do
    get :show, id: @savek
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @savek
    assert_response :success
  end

  test "should update savek" do
    patch :update, id: @savek, savek: { avg_rating: @savek.avg_rating, first_name: @savek.first_name, gender: @savek.gender, last_name: @savek.last_name, latitude: @savek.latitude, longitude: @savek.longitude, occupation: @savek.occupation, radius: @savek.radius, ratings: @savek.ratings }
    assert_redirected_to savek_path(assigns(:savek))
  end

  test "should destroy savek" do
    assert_difference('Savek.count', -1) do
      delete :destroy, id: @savek
    end

    assert_redirected_to saveks_path
  end
end
