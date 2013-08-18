class ProductsController < ApplicationController

  # GET /products/1/download
  def download
    @product = Product.find(params[:id])
    send_file @product.attachment.media.current_path
  end

  # PUT /product/1/up
  def up
    @product = Product.find(params[:id])
    @product.move_lower
    
    respond_to do |format|
      format.html { redirect_to products_url, notice: "product position was successfully moved." }
    end
  end
  
  # PUT /product/1/down
  def down
    @product = Product.find(params[:id])
    @product.move_higher
    
    respond_to do |format|
      format.html { redirect_to products_url, notice: "product position was successfully moved." }
    end
  end

  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])
    @product.release_date = Time.zone.now.to_date

    respond_to do |format|
      if @product.save
        Attachment.create(media: params[:attachment], attachmentable: @product) if params[:attachment]
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        if params[:attachment]
          @product.attachment.delete if @product.attachment
          Attachment.create(media: params[:attachment], attachmentable: @product)
        end
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
