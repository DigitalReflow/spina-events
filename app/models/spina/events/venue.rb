module Spina::Events
  class Venue < ApplicationRecord
    extend FriendlyId

    geocoded_by :postcode
    after_validation :geocode, if: ->(obj){ obj.postcode.present? }

    friendly_id :name, use: :slugged

    belongs_to :photo, optional: true
    has_many :events

    validates :name, presence: true, uniqueness: true

    # Create a 301 redirect if the slug changed
    after_save :rewrite_rule, if: -> { saved_change_to_slug? }

    def full_address
      "#{address_line_1}, #{address_line_2}, #{city}, #{postcode}, #{country}"
    end

    private

    def should_generate_new_friendly_id?
      slug.blank? || super
    end

    def rewrite_rule
      RewriteRule.create(old_path: "/events/venues/#{slug_before_last_save}", new_path: "/events/venues/#{slug}")
    end
  end
end
