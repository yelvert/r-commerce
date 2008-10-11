require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:carts)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_cart
    assert_difference('Cart.count') do
      post :create, :cart => { }
    end

    assert_redirected_to cart_path(assigns(:cart))
  end

  def test_should_show_cart
    get :show, :id => carts(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => carts(:one).id
    assert_response :success
  end

  def test_should_update_cart
    put :update, :id => carts(:one).id, :cart => { }
    assert_redirected_to cart_path(assigns(:cart))
  end

  def test_should_destroy_cart
    assert_difference('Cart.count', -1) do
      delete :destroy, :id => carts(:one).id
    end

    assert_redirected_to carts_path
  end
end
