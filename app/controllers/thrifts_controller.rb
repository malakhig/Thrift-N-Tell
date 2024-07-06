class ThriftsController < ApplicationController
  

  #before_action :authenticate_user!
  before_action :set_thrift, only: %i[ show edit update destroy ]

  # GET /thrifts or /thrifts.json
    def index

    if params[:search_location].present? && params[:search].present?
      @thrifts = (Thrift.near(params[:search_location], params[:distance] || 1000, order: :distance)
                             .where("store LIKE :search OR address LIKE :search OR state LIKE :search", search: "%#{params[:search]}%"))
    elsif params[:search_location].present?
      @thrifts = (Thrift.near(params[:search_location], params[:distance] || 1000, order: :distance))
    elsif params[:search].present?
      @thrifts = (Thrift.where("store LIKE :search OR address LIKE :search OR state LIKE :search", search: "%#{params[:search]}%"))
    else
     @thrifts = (Thrift.order("RANDOM()"))
   end
 end


 

  # GET /thrifts/1 or /thrifts/1.json
  def show
    @posts = @thrift.posts
  end

  # GET /thrifts/new
  def new
    @thrift = Thrift.new
  end


  # GET /thrifts/1/edit
  def edit
  end

  # POST /thrifts or /thrifts.json
  def create
    @thrift = Thrift.new(thrift_params)

    respond_to do |format|
      if @thrift.save
        format.html { redirect_to thrift_url(@thrift), notice: "Thrift was successfully created." }
        format.json { render :show, status: :created, location: @thrift }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @thrift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thrifts/1 or /thrifts/1.json
  def update
    respond_to do |format|
      if @thrift.update(thrift_params)
        format.html { redirect_to thrift_url(@thrift), notice: "Thrift was successfully updated." }
        format.json { render :show, status: :ok, location: @thrift }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @thrift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thrifts/1 or /thrifts/1.json
  def destroy
    @thrift.destroy!

    respond_to do |format|
      format.html { redirect_to thrifts_url, notice: "Thrift was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def remove_image
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge_later
    redirect_back(fallback_location: request.referer) 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thrift
      @thrift = Thrift.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def thrift_params
      params.require(:thrift).permit(:store, :address, :phone, :city, :state, :hours, :id, images: [])
    end
end
