require 'test_helper'

class ItemImagesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:item_images)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_item_image
    assert_difference('ItemImage.count') do
      post :create, :item_image => { }
    end

    assert_redirected_to item_image_path(assigns(:item_image))
  end

  def test_should_show_item_image
    get :show, :id => item_images(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => item_images(:one).id
    assert_response :success
  end

  def test_should_update_item_image
    put :update, :id => item_images(:one).id, :item_image => { }
    assert_redirected_to item_image_path(assigns(:item_image))
  end

  def test_should_destroy_item_image
    assert_difference('ItemImage.count', -1) do
      delete :destroy, :id => item_images(:one).id
    end

    assert_redirected_to item_images_path
  end
end
