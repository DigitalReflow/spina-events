module Spina::Events
  class Organisation < ApplicationRecord
    extend FriendlyId

    friendly_id :name, use: :slugged

    belongs_to :photo, optional: true
    validates :name, presence: true

    private

    def should_generate_new_friendly_id?
      slug.blank? || super
    end
  end
end
