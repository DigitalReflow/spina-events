module Spina::Events
  class Sponsor < ApplicationRecord
    extend Mobility

    belongs_to :conference
    belongs_to :organisation

    validates :sponsor_type, presence: true

    translates :sponsor_type
  end
end
