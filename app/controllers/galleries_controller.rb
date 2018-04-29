class GalleriesController < ApplicationController

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

  private
  def gallery_item_params
    params.require(:gallery).permit(:title, :subtitle, :body)
  end
end
