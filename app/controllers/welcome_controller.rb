class WelcomeController < ApplicationController
    def index
        if params[:app_id].nil?
            message = "param missing"
        else 
            app = App.find_by(id: params[:app_id])
            message = app.name
        end
        render json: {message: message}
    end
end
