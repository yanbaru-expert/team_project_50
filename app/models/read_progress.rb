class ReadProgress < ApplicationRecord
  belongs_to :user
  belongs_to :text
  validates :user_id, uniqueness: {
                        scope: :text_id,
                        message: "は同じ教材に2回以上読破済みはできません"
                      }
end
