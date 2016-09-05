class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def show
    
    begin
      user = User.find(params[:id])
      render json: user
    rescue ActiveRecord::RecordNotFound
      render json: ['User Not Found!'], status: 404
    end
  end

  def update
    #Does not produce an error for out of scope user id
    user = User.find(params[:id])

    if user.update(user_params)
      render json: [user, "Updated!"]
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: [user, "Destroyed!"]
  end



  private

  def user_params
    params.require(:user).permit(:username)
  end
end
