class LawCategoriesController < ApplicationController
  before_action :set_law_category, only: [:show, :edit, :update, :destroy]

  # GET /law_categories
  # GET /law_categories.json
  def index
    @law_categories = LawCategory.all
  end

  # GET /law_categories/1
  # GET /law_categories/1.json
  def show
  end

  # GET /law_categories/new
  def new
    @law_category = LawCategory.new
  end

  # GET /law_categories/1/edit
  def edit
  end

  # POST /law_categories
  # POST /law_categories.json
  def create
    @law_category = LawCategory.new(law_category_params)

    respond_to do |format|
      if @law_category.save
        format.html { redirect_to @law_category, notice: 'Law category was successfully created.' }
        format.json { render :show, status: :created, location: @law_category }
      else
        format.html { render :new }
        format.json { render json: @law_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /law_categories/1
  # PATCH/PUT /law_categories/1.json
  def update
    respond_to do |format|
      if @law_category.update(law_category_params)
        format.html { redirect_to @law_category, notice: 'Law category was successfully updated.' }
        format.json { render :show, status: :ok, location: @law_category }
      else
        format.html { render :edit }
        format.json { render json: @law_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /law_categories/1
  # DELETE /law_categories/1.json
  def destroy
    @law_category.destroy
    respond_to do |format|
      format.html { redirect_to law_categories_url, notice: 'Law category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def import 
    LawCategory.import(params[:file])
    redirect_to root_url, notice: "Law Categories imported"
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_law_category
      @law_category = LawCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def law_category_params
      params.require(:law_category).permit(:category)
    end
end