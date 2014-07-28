class DatasetsController < ApplicationController
  before_action :signed_in_user
  before_action :set_dataset, only: [:show, :edit, :update, :destroy]

  # GET /datasets
  # GET /datasets.json
  def index
    @datasets = Dataset.all
  end

  # GET /datasets/1
  # GET /datasets/1.json
  def show
    respond_to do |format|
      format.html
      format.csv {
        @data = @dataset.data
        send_data @data, 
        :type => 'text/csv; charset=iso-8859-1; header=present', :stream => true,
        :disposition => "attachment; filename=#{@dataset.user.student_number}_#{Date.today.strftime('%Y%m%d')}.csv"
      }
    end
  end

  # GET /datasets/new
  def new
    @dataset = Dataset.new
    3.times { @dataset.headers.build }
  end

  # GET /datasets/1/edit
  def edit
  end

  # POST /datasets
  # POST /datasets.json
  def create
    @dataset = Dataset.new(dataset_params)

    if @dataset.save
      redirect_to @dataset
      flash[:success] = "Dataset was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /datasets/1
  # PATCH/PUT /datasets/1.json
  def update
    if @dataset.update(dataset_params)
      redirect_to @dataset
      flash[:success] = "Dataset was successfully updated."
    else
      render action: 'edit'
    end
  end

  # DELETE /datasets/1
  # DELETE /datasets/1.json
  def destroy
    @dataset.destroy
    redirect_to datasets_url
    flash[:success] = "Dataset was successfully deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dataset
      @dataset = Dataset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dataset_params
      params.require(:dataset).permit(:user_id, :unit_id, :project_name, :project_date, :project_location, :latitude, :longitude, :methods, :missing_data, :project_notes, :data, headers_attributes: [:id, :header_name, :header_unit, :header_notes, :_destroy])
    end
end
