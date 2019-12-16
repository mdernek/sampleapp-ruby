class UsersController < ApplicationController
    def login
        @user = User.new
    end
    
    def login_submit
        @user = User.new(user_params)

        if @user.valid?
            if @user.login
                cookies.encrypted[:email] = {
                    value: @user.email,
                    expires: 1.year,
                    secure: Rails.env.production?,
                    httponly: true
                  }
                redirect_to articles_path
            else
                @user.errors[:base] << "Please check your e-mail and password"
                render 'login'
            end
        else
            render 'login'
        end
    end

    def logout
        cookies.delete :email
        redirect_to home_path
    end
    
    private
        def user_params
            params[:user].permit(:email, :password)
        end
end
