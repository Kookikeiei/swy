  class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
   @user = User.find(session[:user_id])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if session[:admin] == '555'
      session[:admin] = nil
    end
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_path }
      format.json { head :no_content }
    end
  end

  def admin 
    
    if session[:admin] != '555'
      flash[:notice] = 'You are not admin please Login'
      redirect_to root_path 
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { head :no_content }
      end 
    end   
  end
  
  def about
  end
  def er
  end
  def mockup
  end
  def story
  end
  def featire
  end

  def information
    @user = User.find(session[:user_id])
       if @user.username == 'admin'
         @user = User.find(params[:id])
       end
  end
  
  def meminf
    
    if session[:admin] != '555'
      flash[:notice] = 'You are not admin please Login'
      redirect_to root_path 
    else
      @users = User.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @users }
      end 
    end   
  end

end
