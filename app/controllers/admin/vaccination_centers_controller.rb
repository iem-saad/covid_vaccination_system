class Admin::VaccinationCentersController < ApplicationController
  before_action :set_admin_vaccination_center, only: %i[ show edit update destroy ]

  # GET /admin/vaccination_centers or /admin/vaccination_centers.json
  def index
    @admin_vaccination_centers = Admin::VaccinationCenter.find_by_sql("SELECT * FROM ADMIN_VACCINATION_CENTERS")
  end

  # GET /admin/vaccination_centers/1 or /admin/vaccination_centers/1.json
  def show
  end

  # GET /admin/vaccination_centers/new
  def new
    @admin_vaccination_center = Admin::VaccinationCenter.new
  end

  # GET /admin/vaccination_centers/1/edit
  def edit
  end

  # POST /admin/vaccination_centers or /admin/vaccination_centers.json
  def create
    max_id = Admin::VaccinationCenter.maximum(:id)
    max_id = 0 if max_id.nil?
    sql = "INSERT INTO ADMIN_VACCINATION_CENTERS VALUES (#{max_id+1}, '#{admin_vaccination_center_params[:name]}', '#{admin_vaccination_center_params[:location]}', #{admin_vaccination_center_params[:head_id]})"
    respond_to do |format|
      if ActiveRecord::Base.connection.exec_insert(sql)
        @admin_vaccination_center =  Admin::VaccinationCenter.find_by_sql("SELECT * FROM ADMIN_VACCINATION_CENTERS WHERE ID = #{max_id + 1}").first
        format.html { redirect_to @admin_vaccination_center, notice: "Vaccination center was successfully created." }
        format.json { render :show, status: :created, location: @admin_vaccination_center }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_vaccination_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/vaccination_centers/1 or /admin/vaccination_centers/1.json
  def update
    sql = "UPDATE ADMIN_VACCINATION_CENTERS "\
    "SET name = '#{admin_vaccination_center_params[:name]}', location = '#{admin_vaccination_center_params[:location]}', head_id = #{admin_vaccination_center_params[:head_id]} "\
    " WHERE ID = #{@admin_vaccination_center.id}"
    respond_to do |format|
      if ActiveRecord::Base.connection.execute(sql)
        format.html { redirect_to @admin_vaccination_center, notice: "Vaccination center was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_vaccination_center }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_vaccination_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/vaccination_centers/1 or /admin/vaccination_centers/1.json
  def destroy
    ActiveRecord::Base.connection.execute("DELETE FROM ADMIN_VACCINATION_CENTERS WHERE ID = #{@admin_vaccination_center.id}")
    respond_to do |format|
      format.html { redirect_to admin_vaccination_centers_url, notice: "Vaccination center was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_vaccination_center
      @admin_vaccination_center = Admin::VaccinationCenter.find_by_sql("SELECT * FROM ADMIN_VACCINATION_CENTERS WHERE ID = #{params[:id]}").first
    end

    # Only allow a list of trusted parameters through.
    def admin_vaccination_center_params
      params.require(:admin_vaccination_center).permit(:name, :location, :head_id)
    end
end
