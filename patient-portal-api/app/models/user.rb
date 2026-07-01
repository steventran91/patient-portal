class User < ApplicationRecord
    has_secure_password

    enum :role, {patient: 0, provider: 1}

    validates :first_name, :last_name, :email, :role, presence: true
    validates :email, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
end
