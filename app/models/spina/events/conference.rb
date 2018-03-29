module Spina::Events
  class Conference < ApplicationRecord
    extend Mobility
    extend FriendlyId

    friendly_id :title, use: :slugged

    belongs_to :photo, optional: true
    belongs_to :attachment, optional: true
    belongs_to :venue

    has_many :conference_speakers
    has_many :speakers, through: :conference_speakers

    has_many :conference_attendees
    has_many :attendees, through: :conference_attendees, source: :organisation

    has_many :sponsors
    accepts_nested_attributes_for :sponsors, allow_destroy: true

    has_many :questions
    accepts_nested_attributes_for :questions, allow_destroy: true

    has_many :tickets
    accepts_nested_attributes_for :tickets, allow_destroy: true

    validates :title, :description, :start_date, :end_date, presence: true

    # Create a 301 redirect if the slug changed
    after_save :rewrite_rule, if: -> { saved_change_to_slug? }

    scope :draft, -> { where(draft: true) }
    scope :live, -> { where(draft: false) }

    translates :title, :sub_title, :description, :slug, :conference_contact, :sponsorship_info, :location

    private

    def should_generate_new_friendly_id?
      slug.blank? || draft_changed? || super
    end

    def rewrite_rule
      Spina::RewriteRule.create(old_path: "/conferences/#{slug_before_last_save}", new_path: "/conferences/#{slug}")
    end
  end
end
