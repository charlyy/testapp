class UsersController  < ApplicationController

before_filter :authenticate_user!

def show
  @user = User.find(params[:id])
end

def add_admin(user)
  # add_admin
end

end
