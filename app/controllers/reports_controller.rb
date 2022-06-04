# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]

  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def new
    @report = Report.new
  end

  def show
    @comments = @report.comments
    @comment = Comment.new
  end

  def edit; end

  def create
    @report = current_user.report.build(report_params)
    if @report.save
      redirect_to reports_path, notice: t('controllers.common.notice_create', name: Report.model_name.human)
    else
      redirect_to new_report_path, alert: t('controllers.common.alert_create', name: Report.model_name.human)
    end
  end

  def update
    if current_user == @report.user
      if @report.update(report_params)
        redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human)
      else
        redirect_to @report, alert: t('controllers.common.alert_update', name: Report.model_name.human)
      end
    else
      redirect_to @report, alert: t('controllers.common.alert_edit', name: Report.model_name.human)
    end
  end

  def destroy
    if current_user == @report.user
      @report.destroy
      redirect_to reports_path, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
    else
      redirect_to reports_path, alert: t('controllers.common.alert_edit', name: Report.model_name.human)
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :contents)
  end
end
