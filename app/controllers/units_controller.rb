class UnitsController < ApplicationController
  before_action :signed_in_user, only: [:index]
  before_action :set_unit, only: [:show, :edit, :update, :destroy]
  before_action :convenor_user,  only: [:show, :new, :edit, :update, :destroy]

  # GET /units
  # GET /units.json
  def index
    @units = Unit.all
  end

  # GET /units/1
  # GET /units/1.json
  def show
    @unit = Unit.find(params[:id])
    @datasets = Dataset.where(:unit_id => @unit.id).paginate(page: params[:page], per_page: 10)
  end

  # GET /units/new
  def new
    @unit = Unit.new
  end

  # GET /units/1/edit
  def edit
  end

  # POST /units
  # POST /units.json
  def create
    @unit = Unit.new(unit_params)

    if @unit.save
      redirect_to @unit
      flash[:success] = "Unit was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /units/1
  # PATCH/PUT /units/1.json
  def update
    if @unit.update(unit_params)
      redirect_to @unit
      flash[:success] = "Unit details were successfully updated."
    else
      render action: 'edit'
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    @unit.destroy
    redirect_to units_url
    flash[:success] = "Unit was successfully deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params.require(:unit).permit(:user_id, :unit_name, :unit_code, :unit_description)
    end
end
