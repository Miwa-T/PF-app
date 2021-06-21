class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @renge = params[:range]
    search = params[:search]
    word = params[:word]
    @users = User.looks(search, word)
    @follow = current_user.active_relationsips.first
  end
end
