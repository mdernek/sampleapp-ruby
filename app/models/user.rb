require 'pbkdf2'

class User < ApplicationRecord
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
end

class User
    #...continue
    attr_accessor :password
    validates_presence_of :password
end

class User
    #...continue
    PBKDF2_ITERATION = 10000

    def login
        isLoggedIn = false
        user = User.find_by email: self.email

        if user and is_password_same(user)
            self.password = nil
            isLoggedIn = true
        end

        isLoggedIn
    end

    private
        def is_password_same(user)
            @hashed = PBKDF2.new(:password=>self.password, :salt=>user.salt, :iterations=>PBKDF2_ITERATION)
            return user.hashed_password == @hashed.hex_string
        end
end