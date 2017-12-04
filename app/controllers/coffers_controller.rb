class CoffersController < ApplicationController
  before_action :set_coffer, only: [:show, :edit, :update, :destroy]

  # GET /coffers
  # GET /coffers.json
  def index
    @coffers = Coffer.all
    #@coffers = current_user.coffers
  end

  # GET /coffers/1
  # GET /coffers/1.json
  def show
     @coffer = current_user.coffers.find(params[:id])
  end

  # GET /coffers/new
  def new
    @coffer = Coffer.new
    #@coffer = current_user.coffers.new
  end

  # GET /coffers/1/edit
  def edit
  end

  # POST /coffers
  # POST /coffers.json
  def create
    @coffer = Coffer.new(coffer_params)
    
    respond_to do |format|
      if @coffer.save
        format.html { redirect_to @coffer, notice: 'Coffer was successfully created.' }
        format.json { render :show, status: :created, location: @coffer }
      else
        format.html { render :new }
        format.json { render json: @coffer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coffers/1
  # PATCH/PUT /coffers/1.json
  def update
    respond_to do |format|
      if @coffer.update(coffer_params)
        format.html { redirect_to @coffer, notice: 'Coffer was successfully updated.' }
        format.json { render :show, status: :ok, location: @coffer }
      else
        format.html { render :edit }
        format.json { render json: @coffer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coffers/1
  # DELETE /coffers/1.json
  def destroy
    @coffer.destroy
    respond_to do |format|
      format.html { redirect_to coffers_url, notice: 'Coffer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffer
      @coffer = Coffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coffer_params
      params.require(:coffer).permit(:user_id, :asset_name, :asset_type, :asset_size, :asset_info, :date, :user_id)
    end
end
