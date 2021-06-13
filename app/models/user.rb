class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :watch_progresses, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: "test@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
