class Admin::AllocatedVaccsController < ApplicationController
  require 'hairtrigger'
  before_action :set_admin_allocated_vacc, only: %i[ show edit update destroy ]
  after_action :update_vaccine_amount, only: %i[ create update ]

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
    old_amount = "SELECT AMOUNT FROM ADMIN_VACCINES WHERE ID = #{admin_allocated_vacc_params[:vac_id]}"
    old_amount = ActiveRecord::Base.connection.exec_query(old_amount)
    old_amount = old_amount.rows.first.first
    if old_amount >= admin_allocated_vacc_params[:amount].to_i
      max_id = Admin::AllocatedVacc.maximum(:id)
      max_id = 0 if max_id.nil?
      sql = "INSERT INTO ADMIN_ALLOCATED_VACCS VALUES (#{max_id+1}, '#{admin_allocated_vacc_params[:vac_id]}', #{admin_allocated_vacc_params[:center_id]}, #{admin_allocated_vacc_params[:amount]})"
      respond_to do |format|
        if ActiveRecord::Base.connection.exec_insert(sql)
          @admin_allocated_vacc = Admin::AllocatedVacc.find_by_sql("SELECT * FROM ADMIN_ALLOCATED_VACCS WHERE ID = #{max_id + 1}").first
          format.html { redirect_to @admin_allocated_vacc, notice: "Allocated vacc was successfully created." }
          format.json { render :show, status: :created, location: @admin_allocated_vacc }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @admin_allocated_vacc.errors, status: :unprocessable_entity }
        end
      end
    else
      edirect_to admin_allocated_vaccs_path, flash: { error: "Insufficient Vaccines" } and return
    end
  end

  # PATCH/PUT /admin/allocated_vaccs/1 or /admin/allocated_vaccs/1.json
  def update
    old_amount = "SELECT AMOUNT FROM ADMIN_VACCINES WHERE ID = #{admin_allocated_vacc_params[:vac_id]}"
    old_amount = ActiveRecord::Base.connection.exec_query(old_amount)
    old_amount = old_amount.rows.first.first
    if old_amount < admin_allocated_vacc_params[:amount].to_i
      redirect_to admin_allocated_vaccs_path, flash: { error: "Insufficient Vaccines" } and return
    end
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
     ActiveRecord::Base.connection.execute("DELETE FROM ADMIN_ALLOCATED_VACCS WHERE ID = #{@admin_allocated_vacc.id}")
    respond_to do |format|
      format.html { redirect_to admin_allocated_vaccs_url, notice: "Allocated vacc was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # trigger.after(:create) do
  #   <<-SQL
  #     UPDATE ADMIN_VACCINES SET AMOUNT = OLD.AMOUNT - self.amount,
  #     WHERE ID = self.vac_id;
  #   SQL
  # end

  # trigger.after(:update) do
  #   <<-SQL
  #     UPDATE ADMIN_VACCINES SET AMOUNT = OLD.AMOUNT - self.amount,
  #     WHERE ID = self.vac_id;
  #   SQL
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_allocated_vacc
      @admin_allocated_vacc = Admin::AllocatedVacc.find_by_sql("SELECT * FROM ADMIN_ALLOCATED_VACCS WHERE ID = #{params[:id].to_i}").first
    end

    # Only allow a list of trusted parameters through.
    def admin_allocated_vacc_params
      params.require(:admin_allocated_vacc).permit(:vac_id, :center_id, :amount)
    end

    def update_vaccine_amount
      previous_rec = Admin::AllocatedVacc.find_by_sql("SELECT * FROM ADMIN_ALLOCATED_VACCS WHERE vac_id = #{params[:admin_allocated_vacc][:vac_id].to_i} AND center_id = #{params[:admin_allocated_vacc][:center_id].to_i}").first
      return if previous_rec.nil?
      old_amount = "SELECT AMOUNT FROM ADMIN_VACCINES WHERE ID = #{params[:admin_allocated_vacc][:vac_id].to_i}"
      old_amount = ActiveRecord::Base.connection.exec_query(old_amount)
      old_amount = old_amount.rows.first.first
      if old_amount >= previous_rec.amount
        new_amount = old_amount - previous_rec.amount
        sql = "UPDATE ADMIN_VACCINES SET amount = #{new_amount} WHERE ID = #{params[:admin_allocated_vacc][:vac_id].to_i}"
        ActiveRecord::Base.connection.execute(sql)
      end
    end
end
