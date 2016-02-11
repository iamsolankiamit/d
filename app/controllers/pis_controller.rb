class PisController < ApplicationController
  before_action :set_pi, only: [:show, :edit, :update, :destroy]

  # GET /pis
  # GET /pis.json
  def index
    @pis = Pi.all
  end

  # GET /pis/1
  # GET /pis/1.json
  def show
  end

  # GET /pis/new
  def new
    @pi = Pi.new
  end

  # GET /pis/1/edit
  def edit
  end

  # POST /pis
  # POST /pis.json
  def create
    @pi = Pi.new(pi_params)

    respond_to do |format|
      if @pi.save
        format.html { redirect_to @pi, notice: 'Pi was successfully created.' }
        format.json { render :show, status: :created, location: @pi }
        format.js { render "created"}
      else
        format.html { render :new }
        format.json { render json: @pi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pis/1
  # PATCH/PUT /pis/1.json
  def update
    respond_to do |format|
      if @pi.update(pi_params)
        format.html { redirect_to @pi, notice: 'Pi was successfully updated.' }
        format.json { render :show, status: :ok, location: @pi }
        format.js { render "updated"}
      else
        format.html { render :edit }
        format.json { render json: @pi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pis/1
  # DELETE /pis/1.json
  def destroy
    @pi.destroy
    respond_to do |format|
      format.html { redirect_to pis_url, notice: 'Pi was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render "destroy"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pi
      @pi = Pi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pi_params
      params.require(:pi).permit(:name, :uid, :group_id)
    end
end
