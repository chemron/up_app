class User < ApplicationRecord
    before_save {self.username = username.downcase}

    VALID_USERNAME_REGEX = /\A[a-z\.\_0-9\-]+\z/i
    validates(:username, presence: true, length: {minimum:1, maximum:50},
        format: { with: VALID_USERNAME_REGEX},
        uniqueness: true)
    
    validates(:password, presence: true, length: {minimum: 6})
    
    has_secure_password
end
