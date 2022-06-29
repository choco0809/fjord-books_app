# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy edit update]

  def create
    @comment = @commentable.comments.build(comments_params)
    @comment.user = current_user
    @comment.save!
    redirect_to polymorphic_path(@commentable), notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end

  def edit; end

  def update
    @comment.update!(comments_params)
    redirect_to polymorphic_path(@commentable), notice: t('controllers.common.notice_update', name: Comment.model_name.human)
  end

  def destroy
    if @comment.destroy
      redirect_to polymorphic_path(@commentable), notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
    else
      redirect_to polymorphic_path(@commentable), notice: t('controllers.common.alert_destory', name: Comment.model_name.human)
    end
  end

  private

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:comment_contents)
  end
end
