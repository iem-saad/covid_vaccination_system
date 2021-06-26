class AssignedVaccsController < ApplicationController
  before_action :set_assigned_vacc, only: %i[ show edit update destroy ]

  # GET /assigned_vaccs or /assigned_vaccs.json
  def index
    @assigned_vaccs = AssignedVacc.all
  end

  # GET /assigned_vaccs/1 or /assigned_vaccs/1.json
  def show
  end

  # GET /assigned_vaccs/new
  def new
    @assigned_vacc = AssignedVacc.new
  end

  # GET /assigned_vaccs/1/edit
  def edit
  end

  # POST /assigned_vaccs or /assigned_vaccs.json
  def create
    @assigned_vacc = AssignedVacc.new(assigned_vacc_params)
    max_id = AssignedVacc.maximum(:id)
    max_id = 0 if max_id.nil?
    center = ActiveRecord::Base.connection.exec_query("SELECT ID FROM ADMIN_VACCINATION_CENTERS").rows.shuffle.first.first
    vacc = ActiveRecord::Base.connection.exec_query("SELECT vac_id FROM ADMIN_ALLOCATED_VACCS WHERE center_id = #{center}").rows.shuffle.first.first
    sql = "INSERT INTO ASSIGNED_VACCS VALUES (#{max_id+1}, #{assigned_vacc_params[:user_id]}, #{vacc}, #{center})"
    respond_to do |format|
      if ActiveRecord::Base.connection.exec_insert(sql)
        ActiveRecord::Base.connection.execute("UPDATE USERS SET vac_pin = '#{(SecureRandom.random_number(9e4) + 1e4).to_i}' where id = #{assigned_vacc_params[:user_id]}")
        format.html { redirect_to dashboard_index_path, notice: "Congratulations! Successfully Applied For Vaccination" }
        format.json { render :show, status: :created, location: @assigned_vacc }
      else
        format.html { redirect_to dashboard_index_path, notice: "Ops! Something Went Wrong While Applying for Vaccination" }
        format.json { render json: @assigned_vacc.errors, status: :unprocessable_entity }
      end
    end
  end

  def view_vaccination_details
     @vacc_detail = AssignedVacc.find_by_sql("SELECT * FROM assigned_vaccs WHERE user_id = #{params[:user_id].to_i}").first
  end

  # PATCH/PUT /assigned_vaccs/1 or /assigned_vaccs/1.json
  def update
    respond_to do |format|
      if @assigned_vacc.update(assigned_vacc_params)
        format.html { redirect_to @assigned_vacc, notice: "Assigned vacc was successfully updated." }
        format.json { render :show, status: :ok, location: @assigned_vacc }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assigned_vacc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assigned_vaccs/1 or /assigned_vaccs/1.json
  def destroy
    @assigned_vacc.destroy
    respond_to do |format|
      format.html { redirect_to assigned_vaccs_url, notice: "Assigned vacc was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assigned_vacc
      @assigned_vacc = AssignedVacc.find_by_sql("SELECT * FROM assigned_vaccs WHERE ID = #{params[:id]}").first
    end

    # Only allow a list of trusted parameters through.
    def assigned_vacc_params
      params.require(:assigned_vacc).permit(:vaccine_id, :vaccine_center_id, :user_id)
    end
end
