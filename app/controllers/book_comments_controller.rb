class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  #before_action :ensure_correct_user , only: [:destroy]

  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(post_comment_params)
    @comment.book_id = @book.id
    @comment.save
    #redirect_to book_path(book)
  end

  def destroy
    @bookcomment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    #binding.pry
    @bookcomment.destroy
    #redirect_to book_path(params[:book_id])
  end

  private
  def post_comment_params
    params.require(:book_comment).permit(:comment)
  end

end