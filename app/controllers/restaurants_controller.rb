class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update vote_will_split vote_will_not_split ]

  # GET /restaurants or /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1 or /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
    @is_edit = true
  end

  # POST /restaurants or /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully created." }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1 or /restaurants/1.json
  def update
    @is_edit = true

    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    @restaurants = Restaurant.search(name: params[:query_name], location: params[:query_location])

    respond_to do |format|
      format.html { render :index }
      format.json { render :index, status: :ok }
    end
  end

  def vote_will_split
    respond_to do |format|
      if @restaurant.update(:will_split_votes => @restaurant[:will_split_votes] + 1)
        format.html { redirect_to restaurants_url, notice: "Thank you for voting!" }
        format.json { render :index, status: :ok, location: @restaurant }
      else
        format.html { redirect_to restaurants_url, status: :unprocessable_entity, notice: "Something went wrong..." }
        format.json { render :index, json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def vote_will_not_split
    respond_to do |format|
      if @restaurant.update(:will_not_split_votes => @restaurant[:will_not_split_votes] + 1)
        format.html { redirect_to restaurants_url, notice: "Thank you for voting!" }
        format.json { render :index, status: :ok, location: @restaurant }
      else
        format.html { redirect_to restaurants_url, status: :unprocessable_entity, notice: "Something went wrong..." }
        format.json { render :index, json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :location, :will_split_votes, :will_not_split_votes)
    end
end
