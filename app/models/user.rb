class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :watch_progresses, dependent: :destroy
  has_many :watch_progressed_movies, through: :watch_progresses, source: :movie
  has_many :read_progresses, dependent: :destroy
  # user.progressed_texts で user が「読破済み」にしているテキスト教材の一覧を取得できるようになる
  has_many :readprogressed_texts, through: :read_progresses, source: :text

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: "test@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
