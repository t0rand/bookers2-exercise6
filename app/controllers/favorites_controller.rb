class FavoritesController < ApplicationController

  before_action :authenticate_user!

  # def create
  #   post_image = PostImage.find(params[:post_image_id])
  #   favorite = current_user.favorites.new(post_image_id: post_image.id)
  #   favorite.save
  #   redirect_to post_image_path(post_image)
  # end

  # def destroy
  #   post_image = PostImage.find(params[:post_image_id])
  #   favorite = current_user.favorites.find_by(post_image_id: post_image.id)
  #   favorite.destroy
  #   redirect_to post_image_path(post_image)
  # end

  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    redirect_to book_path(@book)
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to book_path(@book)
  end

  # def create
  #   @book = Book.new(book_params)
  #   @book.user_id = current_user.id
  #   if @book.save
  #     redirect_to book_path(@book), notice: "You have created book successfully."
  #   else
  #     @books = Book.all
  #     render 'index'
  #   end
  # end

  # def destroy
  #   @book = Book.find(params[:id])
  #   @book.destroy
  #   redirect_to books_path
  # end

end