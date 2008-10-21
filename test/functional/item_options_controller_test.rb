require 'test_helper'

class ItemOptionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:item_options)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_item_option
    assert_difference('ItemOption.count') do
      post :create, :item_option => { }
    end

    assert_redirected_to item_option_path(assigns(:item_option))
  end

  def test_should_show_item_option
    get :show, :id => item_options(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => item_options(:one).id
    assert_response :success
  end

  def test_should_update_item_option
    put :update, :id => item_options(:one).id, :item_option => { }
    assert_redirected_to item_option_path(assigns(:item_option))
  end

  def test_should_destroy_item_option
    assert_difference('ItemOption.count', -1) do
      delete :destroy, :id => item_options(:one).id
    end

    assert_redirected_to item_options_path
  end
end
