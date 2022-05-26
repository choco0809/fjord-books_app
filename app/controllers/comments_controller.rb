class CommentsController < ApplicationController

  def create
    @comment = @commentable.comments.build(comments_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to polymorphic_path(@commentable), notice: t('controllers.common.notice_create', name: Comment.model_name.human) }
      else
        format.html { render :new }
      end
    end
  end

  private
  def comments_params  
    params.require(:comment).permit(:comment_contents).merge(user_id: current_user.id)
  end  

end
