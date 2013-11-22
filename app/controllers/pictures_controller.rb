class PicturesController < ApplicationController

  def index
    @pictures = Picture.page(params[:page]).per(10)
  end

  def show
    @picture = Picture.find_by(id: params[:id])
  end

  def new
  end

  def create
    @picture = Picture.new
    @picture.image_url = params[:image_url]
    @picture.caption = params[:caption]
    @picture.user_id = params[:user_id]

    if @picture.save
      redirect_to pictures_url, notice: "Picture created successfully."
    else
      render 'new'
    end
  end

  def edit
    @picture = Picture.find_by(id: params[:id])
  end

  def update
    @picture = Picture.find_by(id: params[:id])
    @picture.image_url = params[:image_url]
    @picture.caption = params[:caption]
    @picture.user_id = params[:user_id]

    if @picture.save
      redirect_to pictures_url, notice: "Picture updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @picture = Picture.find_by(id: params[:id])
    @picture.destroy

    redirect_to pictures_url, notice: "Picture deleted."
  end
end
