class UsersController < ApplicationController
  before_action :authenticate_user!

   def show
    @user = User.find(params[:id].to_i)
   end
end
