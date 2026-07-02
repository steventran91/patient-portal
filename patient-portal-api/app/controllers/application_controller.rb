class ApplicationController < ActionController::API
    before_action :authenticate_request

    private
    def authenticate_request
        token = request.headers["Authorization"]&.split(" ")&.last 
        decoded = JwtService.decode(token)
        @current_user = User.find_by(id: decoded&.[]("user_id"))
    end
end
