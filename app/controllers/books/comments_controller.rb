# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_commentable, only: %i[create destroy edit update]

  def create; end

  def destroy; end

  def edit; end

  def update; end

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end
end
