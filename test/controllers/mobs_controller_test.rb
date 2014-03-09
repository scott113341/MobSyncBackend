require 'test_helper'

class MobsControllerTest < ActionController::TestCase
  setup do
    @mob = mobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mob" do
    assert_difference('Mob.count') do
      post :create, mob: { user_ids: @mob.user_ids }
    end

    assert_redirected_to mob_path(assigns(:mob))
  end

  test "should show mob" do
    get :show, id: @mob
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mob
    assert_response :success
  end

  test "should update mob" do
    patch :update, id: @mob, mob: { user_ids: @mob.user_ids }
    assert_redirected_to mob_path(assigns(:mob))
  end

  test "should destroy mob" do
    assert_difference('Mob.count', -1) do
      delete :destroy, id: @mob
    end

    assert_redirected_to mobs_path
  end
end
