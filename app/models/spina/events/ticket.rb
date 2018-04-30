module Spina::Events
  class Ticket < ApplicationRecord
    belongs_to :conference

    validates :name, :description, :code, :current_price, presence: true

    scope :sorted, -> { order(:position) }
  end
end
