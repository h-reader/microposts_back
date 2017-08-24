class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
          # 今回はOAuth認証は行わないため以下はコメントアウト
          # :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
end
