class VideosController < ApplicationController
  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @videos }
    end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @controller = controller_name
    @action = action_name
    @video = Video.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video }
    end
  end

  # GET /videos/new
  # GET /videos/new.json
  def new
    @video = Video.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video }
    end
  end

  # GET /videos/1/edit
  def edit
    @video = Video.find(params[:id])
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(params[:video])

    respond_to do |format|
      if @video.save
        Attachment.create(media: params[:photo_attachment], attachmentable: @video) if params[:photo_attachment]
        Attachment.create(media: params[:video_attachment], attachmentable: @video)if params[:video_attachment]

        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render json: @video, status: :created, location: @video }
      else
        format.html { render action: "new" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /video/1/up
  def up
    @video = Video.find(params[:id])
    @video.move_higher
    
    respond_to do |format|
      format.html { redirect_to videos_url, notice: "video #{@video.title} was successfully moved." }
    end
  end
  
  # PUT /video/1/down
  def down
    @video = Video.find(params[:id])
    @video.move_lower
    
    respond_to do |format|
      format.html { redirect_to videos_url, notice: "video #{@video.title} position was successfully moved." }
    end
  end

  # PUT /videos/1
  # PUT /videos/1.json
  def update
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video])

        if params[:photo_attachment]
          @video.photo_attachment.delete if @video.photo_attachment
          Attachment.create(media: params[:photo_attachment], attachmentable: @video) 
        end

        if params[:video_attachment]
          @video.video_attachment.delete if @video.video_attachment
          Attachment.create(media: params[:video_attachment], attachmentable: @video)          
        end

        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end
end
