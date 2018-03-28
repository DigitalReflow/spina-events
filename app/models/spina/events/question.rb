module Spina::Events
  class Question < ApplicationRecord
    extend Mobility

    belongs_to :conference

    validates :title, :body, presence: true

    scope :sorted, -> { order(:position) }

    translates :title, :body
  end
end
