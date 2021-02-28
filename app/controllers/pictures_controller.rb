class PicturesController < ApplicationController
  include OauthHelper
  before_action :set_picture, only: %i[ show edit update destroy unifa_tweet ]

  # GET /pictures or /pictures.json
  def index
    @pictures = current_user.pictures
  end

  # GET /pictures/1 or /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures or /pictures.json
  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: "Picture was successfully created." }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1 or /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: "Picture was successfully updated." }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1 or /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: "Picture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # send picture to unifa twitter api
  # /pictures/unifa_tweet/1
  def unifa_tweet
    # using an Oauth gem may simplify this

    uri = URI.parse(client_options[:tweet_uri])
    parameters = {text: @picture.title, url: url_for(@picture.picture_file)}

    req = Net::HTTP::Post.new(uri)
    req.body = parameters.to_json
    req['Authorization'] = "Bearer " + session[:unifa_twitter_authorization]
    req['Content-Type'] = "application/json"

    http = Net::HTTP.new(uri.host, uri.port)
    # http.set_debug_output($stdout) # useful for debugging
    http.use_ssl = true

    response = http.request(req)

    # forward response code to user client
    head response.code
    redirect_to pictures_path if request.format.html?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = current_user.pictures.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def picture_params
      params.require(:picture).permit(:title, :picture_file)
    end
end
