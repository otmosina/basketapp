class Admin::GoodsController < Admin::ApplicationController#ApplicationController


  protect_from_forgery
  before_filter :authenticate, :except => [:index, :buy]



  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      md5_of_password = Digest::MD5.hexdigest(password)
      username == 'admin' && password == 'admin'#md5_of_password == 'a86838dae048198de7487400d109bfd3'
    end   
  end 


  def index_for_user
    @goods = Good.all
  end

  def index
    @goods = Good.all
  end

  def show
    @good = Good.find(params[:id])
  end

  def new
    @good = Good.new
  end

  def create
    @good = Good.new(params[:good])
    if @good.save
      redirect_to admin_good_path(@good), :notice => "Successfully created good."
    else
      render :action => 'new'
    end
  end

  def edit
    @good = Good.find(params[:id])
  end

  def update
    @good = Good.find(params[:id])
    if @good.update_attributes(params[:good])
      redirect_to @good, :notice  => "Successfully updated good."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @good = Good.find(params[:id])
    @good.destroy
    redirect_to goods_url, :notice => "Successfully destroyed good."
  end


  def buy
    @good = Good.find(params[:id])
      if current_user.add_good(@good)
        render :json => "Buy"
      else
        render :json => "Something is wrong"
      end   
  end  

end
