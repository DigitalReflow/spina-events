module Spina::Events
  class Session < ApplicationRecord
    belongs_to :conference
    belongs_to :session_type
    validates :title, :description, :duration_minutes, :position, presence: true

    has_many :session_speakers
    has_many :speakers, through: :session_speakers
  end
end
