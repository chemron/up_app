class User < ApplicationRecord
    before_save {self.username = username.downcase}

    VALID_USERNAME_REGEX = /\A[a-z\.\_0-9\-]+\z/i
    validates(:username, presence: true, length: {minimum:1, maximum:50},
        format: { with: VALID_USERNAME_REGEX},
        uniqueness: true)
    
    validates(:password, presence: true, length: {minimum: 6})

    validate :access_token_must_be_valid

    def access_token_must_be_valid
        if !is_access_token_valid?(self.access_token)
            errors.add(:access_token, "must be valid")
        end
    end
    
    has_secure_password
end
