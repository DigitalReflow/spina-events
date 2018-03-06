module Spina::Events
  class Question < ApplicationRecord
    belongs_to :conference

    validates :title, :body, presence: true

    scope :sorted, -> { order(:position) }
  end
end
