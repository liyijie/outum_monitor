class PhotosController < ApplicationController
  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        Attachment.create(media: params[:attachment], attachmentable: @photo) if params[:attachment]
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photo/1/up
  def up
    @photo = Photo.find(params[:id])
    @photo.move_higher
    
    respond_to do |format|
      format.html { redirect_to photos_url, notice: "Photo #{@photo.title} was successfully moved." }
    end
  end
  
  # PUT /photo/1/down
  def down
    @photo = Photo.find(params[:id])
    @photo.move_lower
    
    respond_to do |format|
      format.html { redirect_to photos_url, notice: "Photo #{@photo.title} position was successfully moved." }
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])
    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        if params[:attachment]
          @photo.attachment.delete if @photo.attachment
          Attachment.create(media: params[:attachment], attachmentable: @photo)
        end
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end
end
