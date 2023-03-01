class WelcomeController < ApplicationController
    def index
        #if no params provided
        if params[:by].nil?
            app = App.where(id: [1..50]).sort_by{|e| e[:id]}
            message = app
        elsif params[:by] != "id" && params[:by] != "name"
            message = "we can sort only by id or name."
        elsif params[:by] == "id"
            if params[:start].nil? && params[:end].nil?
                app = App.where(id: [1..50]).sort_by{|e| e[params[:by]]}
            else
                app = App.where(id: [params[:start]..params[:end]]).sort_by{|e| e[params[:by]]}
            end
            message = app
        elsif params[:by] == "name"
            if params[:start].nil? && params[:end].nil?
                app = App.where(id: [1..50]).sort_by{|e| e[params[:by]]}
            else
                app = App.where(name: [params[:start]..params[:end]]).sort_by{|e| e[params[:by]]}
            end
            message = app
        end
        render json: {message: message}
    end
end
