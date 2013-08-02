class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Registration successfful"
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user#User.find(params[:id])
  end

  def update
    @user = current_user#User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice  => "Successfully updated profile."
    else
      render :action => 'edit'
    end
  end

  def add_some_money
    @user = current_user
    @user.update_attribute(:balance, 1000)


    redirect_to root_url
    #render :json => "ok"
  end  


end
