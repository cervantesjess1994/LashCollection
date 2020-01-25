class User < ActiveRecord::Base
    has_secure_password

    has_many :lash_posts
end