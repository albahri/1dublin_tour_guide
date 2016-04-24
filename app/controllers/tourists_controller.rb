class TouristsController < ApplicationController
  before_action :set_tourist, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user! 
  # GET /tourists
  # GET /tourists.json
  def index
    @tourists = Tourist.all
    if params[:search]
      @tourists = Tourist.search(params[:search]).order("created_at DESC")
      else
        @tourists + Tourist.all.order('created_at DESC')
        end
  end

  # GET /tourists/1
  # GET /tourists/1.json
  def show
  end

  # GET /tourists/new
  def new
    @tourist = Tourist.new
  end

  # GET /tourists/1/edit
  def edit
  end

  # POST /tourists
  # POST /tourists.json
  def create
    @tourist = Tourist.new(tourist_params)

    respond_to do |format|
      if @tourist.save
        format.html { redirect_to @tourist, notice: 'Tourist was successfully created.' }
        format.json { render :show, status: :created, location: @tourist }
      else
        format.html { render :new }
        format.json { render json: @tourist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tourists/1
  # PATCH/PUT /tourists/1.json
  def update
    respond_to do |format|
      if @tourist.update(tourist_params)
        format.html { redirect_to @tourist, notice: 'Tourist was successfully updated.' }
        format.json { render :show, status: :ok, location: @tourist }
      else
        format.html { render :edit }
        format.json { render json: @tourist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tourists/1
  # DELETE /tourists/1.json
  def destroy
    @tourist.destroy
    respond_to do |format|
      format.html { redirect_to tourists_url, notice: 'Tourist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tourist
      @tourist = Tourist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tourist_params
      params.require(:tourist).permit(:firstname, :lastname, :email, :phone)
    end
end
