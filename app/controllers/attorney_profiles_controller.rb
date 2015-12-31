class AttorneyProfilesController < ApplicationController
  before_action :set_attorney_profile, only: [:show, :edit, :update, :destroy]

  # GET /attorney_profiles
  # GET /attorney_profiles.json
  def index
    location_array = Geocoder.coordinates(params[:location])
    if params[:q].blank?
      q ="*"
    else 
      q = params[:q]
    end 
    @attorney_profiles = AttorneyProfile.search params[:q],boost_by_distance: {field: :location, origin: {lat:location_array[0].to_f, lon: location_array[1].to_f}},fields: [:law_categories,:first_name,:last_name,:firm_name]
  end

  # GET /attorney_profiles/1
  # GET /attorney_profiles/1.json
  def show
    @attorneyprofile = AttorneyProfile.find(params[:id])
  end

  # GET /attorney_profiles/new
  def new
    @attorney_profile = AttorneyProfile.new
  end

  # GET /attorney_profiles/1/edit
  def edit
  end

  # POST /attorney_profiles
  # POST /attorney_profiles.json
  def create
    @attorney_profile = AttorneyProfile.new(attorney_profile_params)

    respond_to do |format|
      if @attorney_profile.save
        format.html { redirect_to @attorney_profile, notice: 'Attorney profile was successfully created.' }
        format.json { render :show, status: :created, location: @attorney_profile }
      else
        format.html { render :new }
        format.json { render json: @attorney_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attorney_profiles/1
  # PATCH/PUT /attorney_profiles/1.json
  def update
    respond_to do |format|
      if @attorney_profile.update(attorney_profile_params)
        format.html { redirect_to @attorney_profile, notice: 'Attorney profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @attorney_profile }
      else
        format.html { render :edit }
        format.json { render json: @attorney_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attorney_profiles/1
  # DELETE /attorney_profiles/1.json
  def destroy
    @attorney_profile.destroy
    respond_to do |format|
      format.html { redirect_to attorney_profiles_url, notice: 'Attorney profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def import
    AttorneyProfile.import(params[:file])
    redirect_to root_url, notice: "Products imported"
  end  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attorney_profile
      @attorney_profile = AttorneyProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attorney_profile_params
      params.require(:attorney_profile).permit(:first_name, :middle_name, :last_name, :suffix, :firm_name, :firm_address, :office_phone, :licensed_since)

    end
end
