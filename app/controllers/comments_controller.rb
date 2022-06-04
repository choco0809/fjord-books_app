# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy edit update]

  def create
    @comment = @commentable.comments.build(comments_params)
    if @comment.save
      redirect_to polymorphic_path(@commentable), notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      redirect_to polymorphic_path(@commentable), alert: t('controllers.common.alert_create', name: Comment.model_name.human)
    end
  end

  def edit
    @comments = @commentable.comments
  end

  def update
    if current_user.id == @comment.user[:id]
      @comment.update(comments_params)
      redirect_to polymorphic_path(@commentable), notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      redirect_to polymorphic_path(@commentable), alert: t('controllers.common.alert_edit', name: Comment.model_name.human)
    end
  end

  def destroy
    if current_user.id == @comment.user[:id]
      @comment.destroy
      redirect_to polymorphic_path(@commentable), notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
    else
      redirect_to polymorphic_path(@commentable), alert: t('controllers.common.alert_edit', name: Comment.model_name.human)
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:comment_contents).merge(user_id: current_user.id)
  end
end
