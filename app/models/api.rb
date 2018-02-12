class Api < ApplicationRecord
    validates :user_email, presence:true
    validates :nonce, presence:true
    validates :challenge_code, presence:true
end
