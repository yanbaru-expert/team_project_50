class Text < ApplicationRecord
  has_many :read_progresses, dependent: :destroy
  # text.progressed_users で text を「読破済み」にしているユーザーの一覧を取得できるようになる
  has_many :readprogressed_users, through: :read_progresses, source: :user
  with_options presence: true do
    validates :genre
    validates :title
    validates :content
  end
# text を user が「読破済み」しているときは「true」,「いいね」していないときは「false」
  def readprogressed_by?(user)
    read_progresses.any? { |read_progress| read_progress.user_id == user.id }
  end

  enum genre: {
    invisible: 0,
    basic: 1,
    git: 2,
    ruby: 3,
    rails: 4,
    php: 5
  }

  RAILS_GENRE_LIST = %w[basic git ruby rails].freeze
end
