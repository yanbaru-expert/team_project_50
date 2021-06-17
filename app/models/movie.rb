class Movie < ApplicationRecord
  has_many :watch_progresses, dependent: :destroy
  has_many :watch_progressed_users, through: :watch_progresseses, source: :user
  with_options presence: true do
    validates :genre
    validates :title
    validates :url
  end

  enum genre: {
    invisible: 0,
    basic: 1,
    git: 2,
    ruby: 3,
    rails: 4,
    php: 5,
  }

  RAILS_GENRE_LIST = %w[basic git ruby rails]
  PHP_GENRE_LIST = %w[php]
  
  def self.filter_by(genre)
    if genre == "php"
      Movie.where(genre: Movie::PHP_GENRE_LIST)
    else
      Movie.where(genre: Movie::RAILS_GENRE_LIST)
    end
  end
  
  def watch_progressed_by?(user)
    watch_progresses.any? { |watch_progress| watch_progress.user_id == user.id }
  end
end
