class User < ApplicationRecord
    VALID_USERNAME_REGEX = /\A[^\s]+\z/
    validates(:username, presence: true, length: {minimum:1, maximum:50},
        format: { with: VALID_USERNAME_REGEX})
end
