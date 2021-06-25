class Admin::AllocatedVaccsController < ApplicationController
  before_action :set_admin_allocated_vacc, only: %i[ show edit update destroy ]

  # GET /admin/allocated_vaccs or /admin/allocated_vaccs.json
  def index
    @admin_allocated_vaccs = Admin::AllocatedVacc.find_by_sql("SELECT * FROM ADMIN_ALLOCATED_VACCS")
  end

  # GET /admin/allocated_vaccs/1 or /admin/allocated_vaccs/1.json
  def show
  end

  # GET /admin/allocated_vaccs/new
  def new
    @admin_allocated_vacc = Admin::AllocatedVacc.new
  end

  # GET /admin/allocated_vaccs/1/edit
  def edit
  end

  # POST /admin/allocated_vaccs or /admin/allocated_vaccs.json
  def create
    max_id = Admin::AllocatedVacc.maximum(:id)
    sql = "INSERT INTO ADMIN_ALLOCATED_VACCS VALUES (#{max_id+1}, '#{admin_allocated_vacc_params[:vac_id]}', #{admin_allocated_vacc_params[:center_id]}, #{admin_allocated_vacc_params[:amount]})"

    respond_to do |format|
      if ActiveRecord::Base.connection.exec_insert(sql)
        @admin_allocated_vacc = Admin::AllocatedVacc..find_by_sql("SELECT * FROM ADMIN_ALLOCATED_VACCS WHERE ID = #{max_id + 1}").first
        format.html { redirect_to @admin_allocated_vacc, notice: "Allocated vacc was successfully created." }
        format.json { render :show, status: :created, location: @admin_allocated_vacc }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_allocated_vacc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/allocated_vaccs/1 or /admin/allocated_vaccs/1.json
  def update
    sql = "UPDATE ADMIN_ALLOCATED_VACCS "\
    "SET vac_id = '#{admin_allocated_vacc_params[:vac_id]}', center_id = '#{admin_allocated_vacc_params[:center_id]}', amount = #{admin_allocated_vacc_params[:amount]} "\
    " WHERE ID = #{@admin_allocated_vacc.id}"
    respond_to do |format|
      if ActiveRecord::Base.connection.execute(sql)
        format.html { redirect_to @admin_allocated_vacc, notice: "Allocated vacc was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_allocated_vacc }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_allocated_vacc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/allocated_vaccs/1 or /admin/allocated_vaccs/1.json
  def destroy
     ActiveRecord::Base.connection.execute("DELETE FROM ADMIN_ALLOCATED_VACCS WHERE ID = #{@admin_vaccine.id}")
    respond_to do |format|
      format.html { redirect_to admin_allocated_vaccs_url, notice: "Allocated vacc was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_allocated_vacc
      @admin_allocated_vacc = Admin::AllocatedVacc.find_by_sql("SELECT * FROM ADMIN_ALLOCATED_VACCS WHERE ID = #{params[:id]}").first
    end

    # Only allow a list of trusted parameters through.
    def admin_allocated_vacc_params
      params.require(:admin_allocated_vacc).permit(:vac_id, :center_id, :amount)
    end
end
