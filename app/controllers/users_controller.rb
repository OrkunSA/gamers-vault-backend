class UsersController < ApplicationController
  

  def index 
    users = User.all 
    render json: users, except: [:created_at, :updated_at], include: [:collections]
  end
  

  def create
    user = User.new(user_params)

    if user.save
      session[:id] = user.id
      render json: { status: 201, user: user, logged_in: true}
    else
      render json: { status: 500, message: 'There was an error in creating an account'}
    end
  end

  def collection 
    
    render json: current_user.games, except: [:created_at, :updated_at] 
  end
  
  def destroy
    game = Collection.find_by(game_id: params[:id])
    game.destroy
    render json: {message: "Succesfully deleted"}
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  
end