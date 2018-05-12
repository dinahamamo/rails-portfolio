class GalleriesController < ApplicationController
  before_action :set_gallery_item, only: [:edit, :update, :show]
  def index
    @gallery_items = Gallery.all
  end

  def new
    @gallery_item = Gallery.new
  end
  

  def create
    @gallery_item = Gallery.new(gallery_item_params)

    respond_to do |format|
      if @gallery_item.save
        format.html { redirect_to galleries_path, notice: "Your project is now live" }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @gallery_item.update(gallery_item_params)
        format.html { redirect_to galleries_path, notice: "Your project was successfully updated" }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  private
  def set_gallery_item
    @gallery_item = Gallery.find(params[:id])
  end

  def gallery_item_params
    params.require(:gallery).permit(:title, :subtitle, :body)
  end
end
