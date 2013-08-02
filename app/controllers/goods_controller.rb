class GoodsController < ApplicationController
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
      redirect_to @good, :notice => "Successfully created good."
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
end
