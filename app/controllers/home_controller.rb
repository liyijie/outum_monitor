class HomeController < ApplicationController
  def index
    @controller = controller_name
    @action = action_name
    @videos = Video.all
    @product = Product.stables.first
    @row_count = @videos.size / 3 + (@videos.size % 3 > 0 ? 1 : 0)
  end

  def version
    @products = Product.stables
  end

  # GET /home/patch.json
  def patch
    product = Product.patches.first
    @patch = Patch.new
    @patch.version = product.release_version
    @patch.date = product.release_date
    @patch.url = download_product_url(product) 

    respond_to do |format|
      format.json { render json: @patch }
    end
  end
end


class Patch
  attr_accessor :version, :date, :url
end