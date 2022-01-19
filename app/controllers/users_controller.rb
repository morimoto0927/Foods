class UsersController < ApplicationController
    def show
        @username = current_user.username
    end
end
