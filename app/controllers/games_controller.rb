class GamesController < ApplicationController

    def index 
        games = Game.all 
        render json: games, except: [:created_at, :updated_at], include: [:collections]
    end

    def show 
        game = Game.find_by(id: params[:id])
        render json: game
    end

    def create 
        game = Game.new(game_params)

        if game.save 
            render json: game 
        end
    end

    def game_collection 
        gameID = params[:id]
        gameName = params[:name]
        gameImage = params[:picture]

        gameInDB = Game.find_by(api_id: gameID)

        if gameInDB then 
            if Collection.find_by(user_id: current_user.id, game_id: gameInDB.id) 
                render json: { message: "Already added!"}, status: :service_unavailable
            else 
                added = Collection.find_or_create_by(user_id: current_user.id, game_id: gameInDB.id)
                render json: added, status: :accepted
            end
        else
            newGame = Game.find_or_create_by(api_id: gameID, picture: gameImage, name: gameName)
            just_added = Collection.find_or_create_by(user_id: current_user.id, game_id: newGame.id)
            if just_added 
                render json: just_added, status: :accepted
            else 
                render json: { message: "Unable to add game"}, 
                status: :service_unavailable
            end
        end
       
    end
      
    private 

    def game_params 
        params.require(:game).permit(:id, :picture, :name)
    end

end