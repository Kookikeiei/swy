class RentalsController < ApplicationController
  # GET /rentals
  # GET /rentals.json
  def index
    @rentals = Rental.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rentals }
    end
  end

  # GET /rentals/1
  # GET /rentals/1.json
  def update
    @rental = Rental.find(params[:id])

    respond_to do |format|
      if @rental.update_attributes(params[:rental])
        format.html { redirect_to @rental, notice: 'Rental was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @rental = Rental.find_by_room_no(@user.room_no)

    if session[:admin] == '555'
      if @rental == nil
       session[:user] = @user[:id]
       redirect_to new_rental_path 
      else
       respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @rental }
       end
      end
    else
      if @rental == nil
       redirect_to users_path
      else
       respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @rental }
       end
      end
    end
  end
  
  # GET /rentals/new
  # GET /rentals/new.json
  def new

    @room = User.find(session[:user])
    @rental = Rental.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rental }
    end
  end

  # GET /rentals/1/edit
  def edit
    @rental = Rental.find(params[:id])
    
  end

  # POST /rentals
  # POST /rentals.json
  def create
    @rental = Rental.new(params[:rental])

    respond_to do |format|
      if @rental.save
        format.html { render action: "show" }
        format.json { render json: @rental, status: :created, location: @rental }
      else
        format.html { render action: "new" }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  
end
