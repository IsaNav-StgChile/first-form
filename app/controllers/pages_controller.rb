class PagesController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only: :dashboard
  
  def index
  end


  def create
   @user = User.create(email: params[:email],
                      age: params[:age],
                      comment: params[:comment])
  end

  def dashboard
    if params[:email].present?
     @users = User.where('email = ?', params[:email])
   else
     @users = User.all
   end
  end
end
