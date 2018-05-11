module Spina::Events
  class Session < ApplicationRecord
    enum day: ['Day 1', 'Day 2', 'Day 3']

    belongs_to :conference
    belongs_to :session_type
    validates :title, :description, :duration_minutes, :position, presence: true

    has_many :session_speakers
    has_many :speakers, through: :session_speakers

    scope :sort_by_position, -> { order(position: :asc) }

    def duration_in_minutes=(new_time)
      duration = new_time.to_i.minutes
    end

    def start_time
      current_sort_index = conference.sessions.sort_by_position.index(self)
      sessions_before = conference.sessions.sort_by_position.take(current_sort_index)
      DateTime.now.change({hour: 9, minute: 0}).advance(minutes: sessions_before.sum(&:duration_minutes))
    end

    def next_session
      conference.sessions.where("position > ?", position).order("position ASC").first
    end

    def prev_session
      conference.sessions.where("position < ?", position).order("position DESC").first
    end
  end
end
