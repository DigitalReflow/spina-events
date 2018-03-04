module Spina::Events
  class Sponsor < ApplicationRecord
    belongs_to :conference
    belongs_to :organisation

    validates :sponsor_type, presence: true

  end
end
