class Books::CommentsController < CommentsController
  before_action :set_commentable, only: %i[create destroy edit update]

  def create
    super
  end

  def destroy
    super
  end

  def edit
    super
  end

  def update
    super
  end

  private
  def set_commentable
    @commentable = Book.find(params[:book_id])  
  end  

end
