module Spina::Events
  class Session < ApplicationRecord
    belongs_to :conference
    belongs_to :session_type
    validates :title, :description, :duration_minutes, :position, presence: true

    has_many :session_speakers
    has_many :speakers, through: :session_speakers

    scope :sort_by_position, -> { order(position: :asc) }

    def duration_in_minutes=(new_time)
      duration = new_time.to_i.minutes
    end
  end
end
