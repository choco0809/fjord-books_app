class ReportsController < ApplicationController
  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    p @report
    respond_to do |format|
      if @report.save
        format.html { redirect_to user_reports_path, notice: t('controllers.common.notice_create', name: Report.model_name.human) }
      else
        format.html { render :new }
      end
    end
  end

  def report_params
    params.require(:report).permit(:title, :contents)
  end
end
