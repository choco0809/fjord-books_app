# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_commentable, only: %i[create destroy edit update]

  def create; end

  def destroy; end

  def edit; end

  def update; end

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end
end
