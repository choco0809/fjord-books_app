class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy edit update]
  
  def create
    @comment = @commentable.comments.build(comments_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to polymorphic_path(@commentable), notice: t('controllers.common.notice_create', name: Comment.model_name.human) }
      else
        format.html { redirect_to polymorphic_path(@commentable), alert: t('controllers.common.alert_create', name: Comment.model_name.human) }
      end
    end
  end

  def edit
    @comments = @commentable.comments
  end

  def update
    respond_to do |format|
      @comment.update(comments_params)
      format.html { redirect_to polymorphic_path(@commentable), notice: t('controllers.common.notice_update', name: Comment.model_name.human) }
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_path(@commentable), notice: t('controllers.common.notice_destroy', name: Comment.model_name.human) }
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
