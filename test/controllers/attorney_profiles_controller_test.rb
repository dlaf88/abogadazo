require 'test_helper'

class AttorneyProfilesControllerTest < ActionController::TestCase
  setup do
    @attorney_profile = attorney_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attorney_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attorney_profile" do
    assert_difference('AttorneyProfile.count') do
      post :create, attorney_profile: {  }
    end

    assert_redirected_to attorney_profile_path(assigns(:attorney_profile))
  end

  test "should show attorney_profile" do
    get :show, id: @attorney_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attorney_profile
    assert_response :success
  end

  test "should update attorney_profile" do
    patch :update, id: @attorney_profile, attorney_profile: {  }
    assert_redirected_to attorney_profile_path(assigns(:attorney_profile))
  end

  test "should destroy attorney_profile" do
    assert_difference('AttorneyProfile.count', -1) do
      delete :destroy, id: @attorney_profile
    end

    assert_redirected_to attorney_profiles_path
  end
end
