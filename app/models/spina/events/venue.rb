module Spina::Events
  class Venue < ApplicationRecord
    extend Mobility
    extend FriendlyId

    geocoded_by :postcode
    after_validation :geocode, if: ->(obj){ obj.postcode.present? }

    friendly_id :name, use: :slugged

    belongs_to :photo, optional: true
    has_many :events

    validates :name, presence: true, uniqueness: true

    translates :name, :description, :slug, :address_line_1, :address_line_2, :city, :country

    def full_address
      "#{address_line_1}, #{address_line_2}, #{city}, #{postcode}, #{country}"
    end

    private

    def should_generate_new_friendly_id?
      slug.blank? || super
    end
  end
end
