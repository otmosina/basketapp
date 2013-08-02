require 'test_helper'

class GoodsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Good.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Good.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Good.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to good_url(assigns(:good))
  end

  def test_edit
    get :edit, :id => Good.first
    assert_template 'edit'
  end

  def test_update_invalid
    Good.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Good.first
    assert_template 'edit'
  end

  def test_update_valid
    Good.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Good.first
    assert_redirected_to good_url(assigns(:good))
  end

  def test_destroy
    good = Good.first
    delete :destroy, :id => good
    assert_redirected_to goods_url
    assert !Good.exists?(good.id)
  end
end
