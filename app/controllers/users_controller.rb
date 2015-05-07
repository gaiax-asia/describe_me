class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_current_user, except: :sign_in

  # GET /users
  # GET /users.json
  def index
    @friends = current_user.facebook_details.get_connections("me", "friends")
    @data = @friends.map do |item|
      desc = Description.where(described_user_id: item["id"]).map(&:content)
      current_user.facebook_details.get_object(item["id"]).merge({image: current_user.facebook_details.get_picture(item["id"])}).merge({
        descriptions: desc,
        description: Description.where(described_by_user_id: current_user.uid, described_user_id: item["id"]).first.content
      })
    end

    respond_to do |format|
      format.html {}
      format.json {
        render json: @data.to_json, layout: false, status: 200
      }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user.fb_id), notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user.fb_id), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/:fb_id/describe
  def describe
    p "describing.."
    p params

    @description = Description.new({
      described_user_id: params["fb_id"],
      described_by_user_id: current_user.facebook_details.get_object("me")["id"],
      content: params["description"]
    })
    @description.save!

    render :nothing => true
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def sign_in

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_fb_id(params[:fb_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:fb_id, :first_name, :middle_name, :last_name, :gender, :link, :username)
    end


    def check_current_user
      redirect_to sign_in_users_path unless current_user
    end
end
