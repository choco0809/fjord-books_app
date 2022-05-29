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
    @report = Report.new(report_params)
    respond_to do |format|
      if @report.save
        format.html { redirect_to reports_path, notice: t('controllers.common.notice_create', name: Report.model_name.human) }
      else
        format.html { redirect_to new_report_path, alert: t('controllers.common.alert_create', name: Report.model_name.human) }
      end
    end
  end

  def update
    respond_to do |format|
      @report.update(report_params)
      format.html { redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human) }
    end
  end

  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_path, notice: t('controllers.common.notice_destroy', name: Report.model_name.human) }
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :contents).merge(user_id: current_user.id)
  end
end
