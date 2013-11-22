class PicturesController < ApplicationController
  before_action :set_picture, :only => [:show, :edit, :update, :destroy]
  before_action :user_must_be_owner_of_picture, :only => [:edit, :udpate, :destroy]

  def set_picture
    @picture = User.find(params[:id])
  end

  def user_must_be_owner_of_picture
    unless @picture.user == current_user
      redirect_to root_url, :alert => "You are not authorized for that."
    end
  end

  def index
    @pictures = Picture.page(params[:page]).per(10)
  end

  def show
  end

  def new
  end

  def create
    @picture = Picture.new
    @picture.image_url = params[:image_url]
    @picture.caption = params[:caption]
    @picture.user_id = current_user.id

    if @picture.save
      redirect_to pictures_url, notice: "Picture created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @picture.image_url = params[:image_url]
    @picture.caption = params[:caption]
    @picture.user_id = current_user.id

    if @picture.save
      redirect_to pictures_url, notice: "Picture updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy

    redirect_to pictures_url, notice: "Picture deleted."
  end
end
