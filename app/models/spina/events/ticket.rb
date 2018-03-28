module Spina::Events
  class Ticket < ApplicationRecord
    extend Mobility

    belongs_to :conference

    validates :name, :description, :code, :price, presence: true

    scope :sorted, -> { order(:position) }

    translates :name, :description
  end
end
