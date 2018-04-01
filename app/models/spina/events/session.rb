module Spina::Events
  class Session < ApplicationRecord
    belongs_to :conference
    validates :title, :description, :duration_minutes, :position, presence: true
  end
end
