class CategoriesController < ApplicationController
  before_action :signed_in_user, only: [:show, :index, :new, :edit, :update, :destroy]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  helper_method :sort_column, :sort_direction

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @photos = @category.photos.where('photos.photo_filename LIKE ? OR photos.photo_term LIKE ? OR photos.photo_date LIKE ? OR photos.genus_species LIKE ? OR photos.photo_notes LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").paginate(page: params[:page], per_page: 10)

  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
      flash[:success] = "Category was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    if @category.update(category_params)
      redirect_to @category
      flash[:success] = "Category was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    redirect_to categories_url
    flash[:success] = "Category was successfully deleted."
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:category_name, :category_description)
    end

    def sort_column
      Photo.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
