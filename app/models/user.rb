class User < ApplicationRecord
    VALID_USERNAME_REGEX = /\A[a-z]+\z/i
    validates(:username, presence: true, length: {minimum:1, maximum:50},
        format: { with: VALID_USERNAME_REGEX},
        uniqueness: {case_sensitive: false})
end
