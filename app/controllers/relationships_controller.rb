class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user , only: [:destroy]

  def follow
    current_user.follow(params[:id])
    redirect_back(fallback_location: root_path) #⇦行動する前に居た画面に戻る。
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_back(fallback_location: root_path) #⇦行動する前に居た画面に戻る。
  end

end
