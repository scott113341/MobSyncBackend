class MobsController < ApplicationController
  before_action :set_mob, only: [:show, :edit, :update, :destroy]

  # GET /mobs
  # GET /mobs.json
  def index
    @mobs = Mob.all

    Mob.first.send_push_notification
  end

  # GET /mobs/1
  # GET /mobs/1.json
  def show
    respond_to do |format|
      format.json { render json: @mob.attributes.merge(users: @mob.users, date: Time.now.strftime('%-m/%-d/%Y')) }
    end
  end

  def mymobs
    user = User.find_by_username(params[:username])
    mobs = user.mobs

    if mobs.length > 0
      rendermobs = []

      mobs.each do |mob|
        status = mob.participants.find_by_user_id(user).status
        rendermobs.push({status: status}.merge(mob.attributes))
      end
      render json: rendermobs
    else
      render nothing: true
    end
  end

  # GET /mobs/new
  def new
    @mob = Mob.new
  end

  # GET /mobs/1/edit
  def edit
  end

  # POST /mobs
  # POST /mobs.json
  def create
    @mob = Mob.new
    @mob.user_id = User.where('username LIKE ?', mob_params[:username]).first.id
    @mob.user_idz = params[:usernames].split(',').map{|u| User.find_by_username(u).id }.join(',')
    @mob.destination = params[:destination]

    respond_to do |format|
      if @mob.save
        format.html { redirect_to @mob, notice: 'Mob was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mob }
      else
        format.html { render action: 'new' }
        format.json { render json: @mob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mobs/1
  # PATCH/PUT /mobs/1.json
  def update
    respond_to do |format|
      if @mob.update(mob_params)
        format.html { redirect_to @mob, notice: 'Mob was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mobs/1
  # DELETE /mobs/1.json
  def destroy
    @mob.destroy
    respond_to do |format|
      format.html { redirect_to mobs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mob
      @mob = Mob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mob_params
      params.permit(:user_id, :user_idz, :destination, :username)
    end
end
