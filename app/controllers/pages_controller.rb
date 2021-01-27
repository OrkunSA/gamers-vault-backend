class PagesController < ApplicationController

    def home
      render json: { status: 200 }
    end
end