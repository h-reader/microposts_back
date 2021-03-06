class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:show, :update, :destroy]

  # GET /microposts
  # GET /microposts.json
  def index
    @microposts = Micropost.all
    render json: @microposts
  end

  # GET /microposts/1
  # GET /microposts/1.json
  def show
  end

  # GET /user/1/microposts
  # GET /user/1/microposts.json
  def list
    render json: User.find(params[:id]).microposts
  end

  # POST /api/microposts
  # POST /api/microposts.json
  def create
    @micropost = Micropost.new(micropost_params)

    if @micropost.save
      render json: @micropost
    else
      render json: @micropost.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /microposts/1
  # PATCH/PUT /microposts/1.json
  def update
    if @micropost.update(micropost_params)
      render :show, status: :ok, location: @micropost
    else
      render json: @micropost.errors, status: :unprocessable_entity
    end
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    @micropost.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micropost_params
      params.require(:micropost).permit(:content, :user_id, :created_at, :updated_at)
      #params.fetch(:micropost, {})
    end
end
