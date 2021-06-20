class Admin::SearchesController < ApplicationController
  def search
    @renge = params[:range]
    search = params[:search]
    word = params[:word]
    @users = User.looks(search, word)
  end
end
