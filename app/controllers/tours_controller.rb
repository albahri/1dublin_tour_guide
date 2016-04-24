require 'tour_decorator'
class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user! 
  before_filter :ensure_admin, :only =>[:edit, :destroy]

  # GET /tours
  # GET /tours.json
  def index
    @tours = Tour.all
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
  end

  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json

  def create
    @tour = Tour.new()

    @tour.name = params[:tour][:name]
    @tour.place = params[:tour][:place] 
    @tour.date = params[:tour][:date] 
    @tour.time = params[:tour][:time]
    # @tour.description = params[:tour][:description]
    @tour.cost = params[:tour][:cost]

     #create an instance/object of a BasicTour
    myTour = BasicTour.new(50, @tour.name ,@tour.place, @tour.date, @tour.time, @tour.description )

    #add the extra features to the new Tour 
    if params[:tour][:audio].to_s.length > 0 then 
      myTour = AudioTourDecorator.new(myTour)
    end

    if params[:tour][:lunch].to_s.length > 0 then 
      myTour = LunchDecorator.new(myTour)
    end
    #populate the cost and description details
    @tour.cost = myTour.cost
    @tour.description = myTour.details
    


    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_params
      params.require(:tour).permit(:name, :place, :date, :time, :cost, :description)
    end
    def ensure_admin
      unless current_user && current_user.admin?
        render :text => "Access Error Message", :status => :unauthorized
    end
  end
end


