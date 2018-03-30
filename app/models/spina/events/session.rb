module Spina::Events
  class Session < ApplicationRecord
    belongs_to :conference
    validates :title, :description, :start_at, :end_at, presence: true
  end
end
