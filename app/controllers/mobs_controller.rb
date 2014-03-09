class MobsController < ApplicationController
  before_action :set_mob, only: [:show, :edit, :update, :destroy]

  # GET /mobs
  # GET /mobs.json
  def index
    @mobs = Mob.all
  end

  # GET /mobs/1
  # GET /mobs/1.json
  def show
    @mob.send_push_notification
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
    @mob = Mob.new(mob_params)

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
      params.require(:mob).permit(:user_ids)
    end
end
