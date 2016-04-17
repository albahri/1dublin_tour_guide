require 'test_helper'

class TouristsControllerTest < ActionController::TestCase
  setup do
    @tourist = tourists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tourists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tourist" do
    assert_difference('Tourist.count') do
      post :create, tourist: { email: @tourist.email, firstname: @tourist.firstname, lastname: @tourist.lastname, phone: @tourist.phone }
    end

    assert_redirected_to tourist_path(assigns(:tourist))
  end

  test "should show tourist" do
    get :show, id: @tourist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tourist
    assert_response :success
  end

  test "should update tourist" do
    patch :update, id: @tourist, tourist: { email: @tourist.email, firstname: @tourist.firstname, lastname: @tourist.lastname, phone: @tourist.phone }
    assert_redirected_to tourist_path(assigns(:tourist))
  end

  test "should destroy tourist" do
    assert_difference('Tourist.count', -1) do
      delete :destroy, id: @tourist
    end

    assert_redirected_to tourists_path
  end
end
