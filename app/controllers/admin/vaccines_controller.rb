class Admin::VaccinesController < ApplicationController
  before_action :set_admin_vaccine, only: %i[ show edit update destroy ]

  # GET /admin/vaccines or /admin/vaccines.json
  def index
    @admin_vaccines = Admin::Vaccine.find_by_sql("SELECT * FROM ADMIN_VACCINES")
  end

  # GET /admin/vaccines/1 or /admin/vaccines/1.json
  def show
  end

  # GET /admin/vaccines/new
  def new
    @admin_vaccine = Admin::Vaccine.new
  end

  # GET /admin/vaccines/1/edit
  def edit
  end

  # POST /admin/vaccines or /admin/vaccines.json
  def create
    max_id = Admin::Vaccine.maximum(:id)
    max_id = 0 if max_id.nil?
    sql = "INSERT INTO ADMIN_VACCINES VALUES (#{max_id+1}, '#{admin_vaccine_params[:name]}', #{admin_vaccine_params[:no_of_doses]}, #{admin_vaccine_params[:days_to_sec_dose]}, #{admin_vaccine_params[:amount]})"
    respond_to do |format|
      if ActiveRecord::Base.connection.exec_insert(sql)
        @admin_vaccine =  Admin::Vaccine.find_by_sql("SELECT * FROM ADMIN_VACCINES WHERE ID = #{max_id + 1}").first
        format.html { redirect_to @admin_vaccine, notice: "Vaccine was successfully created." }
        format.json { render :show, status: :created, location: @admin_vaccine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_vaccine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/vaccines/1 or /admin/vaccines/1.json
  def update
    sql = "UPDATE ADMIN_VACCINES "\
    "SET name = '#{admin_vaccine_params[:name]}', no_of_doses = #{admin_vaccine_params[:no_of_doses]}, days_to_sec_dose = #{admin_vaccine_params[:days_to_sec_dose]}, "\
    "amount = #{admin_vaccine_params[:amount]} WHERE ID = #{@admin_vaccine.id}"
    respond_to do |format|
      if ActiveRecord::Base.connection.execute(sql)
        format.html { redirect_to @admin_vaccine, notice: "Vaccine was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_vaccine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_vaccine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/vaccines/1 or /admin/vaccines/1.json
  def destroy
    ActiveRecord::Base.connection.execute("DELETE FROM ADMIN_VACCINES WHERE ID = #{@admin_vaccine.id}")
    respond_to do |format|
      format.html { redirect_to admin_vaccines_url, notice: "Vaccine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_vaccine
      @admin_vaccine =  Admin::Vaccine.find_by_sql("SELECT * FROM ADMIN_VACCINES WHERE ID = #{params[:id]}").first
    end

    # Only allow a list of trusted parameters through.
    def admin_vaccine_params
      params.require(:admin_vaccine).permit(:name, :no_of_doses, :days_to_sec_dose, :amount)
    end
end
